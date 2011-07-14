class CreateDesligamentos < ActiveRecord::Migration
  def self.up
    create_table :desligamentos do |t|
  	  t.references :membro
  	  t.string :motivo
  	  t.string :descricao
  	  t.date :data
      t.references :usuario
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :desligamentos
  end
end
