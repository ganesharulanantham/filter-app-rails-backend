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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160227052255) do

  create_table "screenings", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "locations",          limit: 255
    t.integer  "release_year",       limit: 4
    t.string   "production_company", limit: 255
    t.string   "actor_1",            limit: 255
    t.string   "actor_2",            limit: 255
    t.string   "actor_3",            limit: 255
    t.string   "director",           limit: 255
    t.string   "distributor",        limit: 255
    t.string   "writer",             limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "fun_facts",          limit: 65535
  end

end
