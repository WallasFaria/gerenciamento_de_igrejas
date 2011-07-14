# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110704235213) do

  create_table "desligamentos", :force => true do |t|
    t.integer  "membro_id"
    t.string   "motivo"
    t.string   "descricao"
    t.date     "data"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filiais", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.text     "historia"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membros", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.date     "data_de_entrada"
    t.date     "data_de_batismo"
    t.date     "data_de_nascimento"
    t.integer  "filial_id"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.boolean  "ativo",               :default => true
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministerios", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nomeacoes", :force => true do |t|
    t.date     "data"
    t.integer  "membro_id"
    t.integer  "ministerio_id"
    t.boolean  "ativo",         :default => true
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telefones", :force => true do |t|
    t.string   "numero"
    t.integer  "membro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transferencia", :force => true do |t|
    t.date     "data"
    t.integer  "membro_id"
    t.integer  "filial_origem_id"
    t.integer  "filial_destino_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "role_id"
    t.integer  "filial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
