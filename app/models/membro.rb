class Membro < ActiveRecord::Base
  has_many :telefones
  has_many :transferencias
  has_many :nomeacoes
  has_many :desligamentos
  belongs_to :filial
  has_many :ministerios, :through => :nomeacoes
  
  validates_presence_of :nome, :filial, :email, :data_de_entrada, :telefone, :data_de_nascimento
  validates_attachment_presence :imagem
  validates_uniqueness_of :email
  #validates_format_of :telefone, :with=>/^\d{14}$/, :message=>'deve ser formado por 10 digitos'
  validates_attachment_size :imagem, :less_than => 0.2.megabytes
  validates_attachment_content_type :imagem,
    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
    :message => "Oops! Certifique-se de que voce esta enviando um arquivo de imagem."
  has_attached_file :imagem, :styles => {:tamanho_pequeno=>"100x100",
                                         :tamanho_medio=>"300x300"}
                                         
  attr_accessor :telefone
  attr_reader :retorno
  after_create :add_telefone

  def idade
    hoje = Time.now
    if hoje.month < data_de_nascimento.month or (hoje.month == data_de_nascimento.month and hoje.day < data_de_nascimento.day )
       hoje.year - data_de_nascimento.year - 1
    else
      hoje.year - data_de_nascimento.year
    end
  end

  def aniversario
    if Time.now.month < data_de_nascimento.month or (Time.now.month == data_de_nascimento.month and Time.now.day <= data_de_nascimento.day)
      Time.new(Time.now.year, data_de_nascimento.month, data_de_nascimento.day)
    else
      Time.new(Time.now.year + 1, data_de_nascimento.month, data_de_nascimento.day)
    end
  end
  
  def transferir(data, filial_destino)
    transferencia = transferencias.new(:data => data, :filial_destino_id => filial_destino, :filial_origem => filial)
    if transferencia.save
      self.filial_id = filial_destino
      update
    else
      @retorno = transferencia
      false
    end
  end
  
  def desligar(data, motivo, descricao)
    pode_ser_desligado?
    deslidamento = desligamentos.new(:membro => self, :data => data, :motivo => motivo, :descricao => descricao)
    if desligamento.save
      self.ativo = false
      update
    else
      @retorno = transferencia
      false
    end
  end
  
  def ministerios
    nomeacoes.select{|n| n.ativo = true}.map{|n| n.ministerio} #selecionar momeacoes ativas
  end
  
  def add_telefone
    telefones.create!(:numero => telefone)
  end
  
=begin
  def excluir_telefone(telefone)
    telefones.delete!(telefone)
  end
  
  def atualizar_telefone(telefone)
    telefones.update!(telefone)
  end
=end

  private
  def pode_ser_desligado?
    raise "Impossivel desligar este membro, o mesmo ja foi desligado." unless ativo == true
  end
end
