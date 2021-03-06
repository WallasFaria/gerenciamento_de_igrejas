class Filial < ActiveRecord::Base
  has_many :membros
  has_attached_file :imagem, :styles => {:tamanho_pequeno=>"150x150",
                                         :tamanho_medio=>"300x300", 
                                         :tamanho_grande=>"600x600"}
  validates_presence_of :nome, :endereco, :bairro, :cidade, :estado
  validates_attachment_presence :imagem  
  validates_attachment_content_type :imagem,
    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
    :message => "Oops! Certifique-se de que voce esta enviando um arquivo de imagem."
  validates_attachment_size :imagem, :less_than => 1.2.megabytes

  def aniversariantes_do_mes
    membros.select{|m| m.data_de_nascimento.strftime('%m').to_i == Time.now.month.to_i }
  end

end
