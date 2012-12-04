# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121201173011) do

  create_table "idhs", :force => true do |t|
    t.integer "owner"
    t.float   "idhm"
    t.float   "renda"
    t.float   "longevidade"
    t.float   "educacao"
    t.integer "ano"
  end

  create_table "lixos", :force => true do |t|
    t.integer "owner"
    t.float   "total"
    t.float   "ceu_aberto"
    t.float   "areas_alagadas"
    t.float   "aterro_controlado"
    t.float   "aterro_sanitario"
    t.float   "compostagem"
    t.float   "triagem"
    t.float   "incineracao"
    t.float   "nao_fixo"
    t.float   "outros"
    t.integer "ano"
  end

  create_table "localidades", :force => true do |t|
    t.string  "nome"
    t.integer "habitantes"
  end

end
