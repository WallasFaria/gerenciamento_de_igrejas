class CreateMinisterios < ActiveRecord::Migration
  def self.up
    create_table :ministerios do |t|
	  t.string :nome
	  t.text :descricao
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :ministerios
  end
end
