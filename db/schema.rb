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

ActiveRecord::Schema.define(version: 20141216201619) do



  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street",           null: false
    t.string   "city",             null: false
    t.string   "zip_code",         null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_id", "addressable_type"], :name => "index_addresses_on_addressable_id_and_addressable_type"

  create_table "doctors", force: true do |t|
    t.string   "fullname",         null: false
    t.string   "specialization",   null: false
    t.integer  "ordering_unit_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doctors", ["fullname"], :name => "index_doctors_on_fullname", :unique => true
  add_index "doctors", ["ordering_unit_id"], :name => "index_doctors_on_ordering_unit_id"

  create_table "ordering_units", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ordering_units", ["name"], :name => "index_ordering_units_on_name", :unique => true

  create_table "patients", force: true do |t|
    t.string   "fullname",   null: false
    t.string   "pesel"
    t.string   "sex",        null: false
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["fullname"], :name => "index_patients_on_fullname", :unique => true
  add_index "patients", ["pesel"], :name => "index_patients_on_pesel", :unique => true

  create_table "treatment_types", force: true do |t|
    t.string   "name"
    t.integer  "treatment_types_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatment_types", ["name"], :name => "index_treatment_types_on_name", :unique => true
  add_index "treatment_types", ["treatment_types_group_id"], :name => "index_treatment_types_on_treatment_types_group_id"

  create_table "treatment_types_groups", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatment_types_groups", ["name"], :name => "index_treatment_types_groups_on_name", :unique => true


  add_foreign_key "doctors", "public.ordering_units", :name => "doctors_ordering_unit_id_fk", :column => "ordering_unit_id", :exclude_index => true

  add_foreign_key "treatment_types", "public.treatment_types_groups", :name => "treatment_types_treatment_types_group_id_fk", :column => "treatment_types_group_id", :exclude_index => true

end
