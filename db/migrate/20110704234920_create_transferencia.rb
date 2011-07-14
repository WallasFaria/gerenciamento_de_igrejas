class CreateTransferencia < ActiveRecord::Migration
  def self.up
    create_table :transferencia do |t|
  	  t.date :data
  	  t.references :membro 
  	  t.references :filial_origem 
  	  t.references :filial_destino
  	  t.references :usuario
      
      t.timestamps
    end
  end

  def self.down
    drop_table :transferencia
  end
end
