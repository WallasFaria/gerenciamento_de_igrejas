class Desligamento < ActiveRecord::Base
  belongs_to :membro
  validates_presence_of :motivo, :descricao, :data
end
