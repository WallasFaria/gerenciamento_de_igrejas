class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.references :role
      t.references :filial
      
      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
