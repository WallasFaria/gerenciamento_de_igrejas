class CreateNomeacoes < ActiveRecord::Migration
  def self.up
    create_table :nomeacoes do |t|
  	  t.date :data 
  	  t.references :membro 
  	  t.references :ministerio 
  	  t.boolean :ativo, :default => true
	    t.references :usuario
      
      t.timestamps
    end
  end

  def self.down
    drop_table :nomeacoes
  end
end
