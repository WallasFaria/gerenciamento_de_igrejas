class Usuario < ActiveRecord::Base
  belongs_to :filial
  belongs_to :role

  attr_accessible :email, :password, :password_confirmation, :role_id, :filial_id
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    usuario = find_by_email(email)
    if usuario && usuario.password_hash == BCrypt::Engine.hash_secret(password, usuario.password_salt)
      usuario
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end
