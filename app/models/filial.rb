class Filial < ActiveRecord::Base
  has_many :membros
  has_attached_file :imagem, :styles => {:tamanho_pequeno=>"150x150",
                                         :tamanho_medio=>"300x300", 
                                         :tamanho_grande=>"600x600"}
  validates_presence_of :nome, :endereco, :bairro, :cidade, :estado
  
  #validates_attachment_presence :imagem  
  
  #validates_attachment_content_type :imagem, :content_type => 'image/jpg'
   
  #validates_attachment_size :foto, :less_than => 0.1.megabytes
end
