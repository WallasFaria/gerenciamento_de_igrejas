
scaffolds

membro
  t.string :nome 
  t.string :email
  t.date :data_de_entrada
  t.date :data_de_batismo
  t.references	:filial
  t.string :endere�o
  t.string :bairro
  t.string :cidade
  t.string :estado
  t.ativo :boolean
  t.string :imagem_file_name
  t.string :imagem_content_type
  t.integer :imagem_file_size
  t.datetime :imagem_updated_at

  
Telefone
  t.string :numero
  t.references :membro

  
desligamento
  t.references: membro
  t.string :motivo
  t.string :descricao
  t.date :data
# a��o ( alterar o status do membro para inativo indicando qual o 
#        motivo ['Exclus�o', 'Afastamento', 'Transfer�ncia_externa', ...] ) 


nomeacao
  t.date :data 
  t.references :membro 
  t.references :ministerio 
  t.boolen :ativo
# açãoo ( dependendo do ministerio a qual o membro est� sendo nomeado o 
#        status de nomea��es anteriores deve ser alterado para inativo )
# Ex:    O membro pode ser di�cono e levita (do minist�rio de louvor) ao mesmo
#        tempo mas sendo ele nomeado a pastor ele deixa de ser di�cono.


transferencia
  t.date :data
  t.references :membro 
  t.references: filial_origem 
  t.references :filial_destino
# ação ( alterar a filial do membro para filial_destino )


ministerio
  t.string :nome
  t.text :descricao

  
filial
  t.string :nome
  t.string :endere�o
  t.string :bairro
  t.string :cidade
  t.string :estado
  t.text :historia
  t.string :imagem_file_name
  t.string :imagem_content_type
  t.integer :imagem_file_size
  t.datetime :imagem_updated_at

Usu�rio n�o tem vinculo com membro, � apenas para gerenciar o sistema
-----------------------------  
usuario
  t.references :filial
  t.references :role

  
role nome:string
-----------------------------

NAS CLASSES

Membro
  has_many :telefones
  has_many :transferencias
  has_many :nomeacoes
  has_one :desligamento
  belongs_to :filial
  
  def ministerios
    selecionar momeacoes ativas
  end
  
Telefone
  belongs_to :membro
  
Nomeacao
  belongs_to :membro
  belongs_to :ministerio
  
Desligamento
  belongs_to :membro
  after_save :tornar_membro_inativo
  
  def tornar_membro_inativo
    
  end
  
Transferencia
  belongs_to :membro
  belongs_to :filial_origem, :class_name => 'Filial'
  belongs_to :filial_destino, :class_name => 'Filial'
  
  after_save :alterar_filial_do_membro
  
  def alterar_filial_do_membro
    
  end
  
Filial
  has_many :membros
  

ROTAS

  resources :membros do
    resources :telefones
    resources :nomeacoes
    resources :transferencia
    resources :desligamentos
  end

  resources :filiais

  resources :ministerios
  
  resources :roles
  
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "usuarios#new", :as => "sign_up"
  resources :usuarios
  resources :sessions
  
  exemplo:

class Form
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  def persisted?; false; end
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end

class FormPendencia < Form
  validates_presence_of :motivo
  attr_accessor :motivo
end

class FormEncaminhamento < Form
  validates_presence_of :encaminhar_para, :obs
  attr_accessor :encaminhar_para, :obs
end

class FormCancelamento < Form
  validates_presence_of :motivo
  attr_accessor :motivo
end

class FormConclusao < Form
  validates_presence_of :obs
  attr_accessor :obs
end

#semantic_form_for @form_encaminhamento, :as => :form_encaminhamento, :url => {:action => :encaminhar }, :method => :post do |form|