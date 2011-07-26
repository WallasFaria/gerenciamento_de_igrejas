class CreateFiliais < ActiveRecord::Migration
  def self.up
    create_table :filiais do |t|
  	  t.string :nome
      t.dade :data_de_fundacao
  	  t.string :endereco
  	  t.string :bairro
  	  t.string :cidade
  	  t.string :estado
  	  t.text :historia
  	  t.string :imagem_file_name
  	  t.string :imagem_content_type
  	  t.integer :imagem_file_size
  	  t.datetime :imagem_updated_at
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :filiais
  end
end
