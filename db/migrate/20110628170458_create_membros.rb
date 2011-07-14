class CreateMembros < ActiveRecord::Migration
  def self.up
    create_table :membros do |t|
      t.string :nome 
      t.string :email
      t.date :data_de_entrada
      t.date :data_de_batismo
      t.date :data_de_nascimento
      t.references	:filial
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.boolean :ativo, :default => true
      t.string :imagem_file_name
      t.string :imagem_content_type
      t.integer :imagem_file_size
      t.datetime :imagem_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :membros
  end
end
