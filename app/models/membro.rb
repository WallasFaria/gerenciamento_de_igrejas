class Membro < ActiveRecord::Base
  has_many :telefones
  has_many :transferencias
  has_many :nomeacoes
  has_many :desligamentos
  belongs_to :filial
  #has_many :ministerios, :through => :nomeacoes
  
  attr_accessor :telefone
  attr_reader :retorno
  after_create :add_telefone

  validates_presence_of :nome
  validates_presence_of :filial
  validates_presence_of :email
  validates_presence_of :data_de_entrada
  validates_presence_of :telefone
  validates_presence_of :data_de_nascimento
  validates_uniqueness_of :email
  validates_format_of :telefone, :with=>/^\d{10}$/, :message=>'deve ser formado por 10 digitos'

  
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
    raise "Impossivel desligar este membro, o memo ja foi desligado." unless ativo == true
  end
end
