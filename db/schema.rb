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

ActiveRecord::Schema.define(version: 20141210155354) do



  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: true do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "specialization",   null: false
    t.integer  "ordering_unit_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctors", ["ordering_unit_id"], :name => "index_doctors_on_ordering_unit_id"

  create_table "ordering_units", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  add_foreign_key "doctors", "public.ordering_units", :name => "doctors_ordering_unit_id_fk", :column => "ordering_unit_id", :exclude_index => true

end
