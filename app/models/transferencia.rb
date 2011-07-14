class Transferencia < ActiveRecord::Base
  belongs_to :membro
  belongs_to :filial_origem, :class_name => 'Filial'
  belongs_to :filial_destino, :class_name => 'Filial'
  validates_presence_of :data, :filial_destino
end
