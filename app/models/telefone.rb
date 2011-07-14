class Telefone < ActiveRecord::Base
  belongs_to :membro
  validates_presence_of :numero
  validates_uniqueness_of :numero
  validates_format_of :numero, :with=>/^\d{10}$/, :message=>'deve ser formado por 10 digitos'
end
