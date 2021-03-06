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

ActiveRecord::Schema.define(version: 20150108203617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
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

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.string   "fullname",                     null: false
    t.string   "specialization",               null: false
    t.integer  "ordering_unit_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "treatments_count", default: 0
  end

  add_index "doctors", ["fullname"], name: "index_doctors_on_fullname", unique: true, using: :btree
  add_index "doctors", ["ordering_unit_id"], name: "index_doctors_on_ordering_unit_id", using: :btree

  create_table "ordering_units", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctors_count", default: 0
  end

  add_index "ordering_units", ["name"], name: "index_ordering_units_on_name", unique: true, using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "fullname",                         null: false
    t.string   "pesel"
    t.string   "sex",                              null: false
    t.date     "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "without_pesel",    default: false
    t.integer  "treatments_count", default: 0
  end

  add_index "patients", ["fullname"], name: "index_patients_on_fullname", unique: true, using: :btree
  add_index "patients", ["pesel"], name: "index_patients_on_pesel", unique: true, using: :btree

  create_table "treatment_times", force: :cascade do |t|
    t.integer  "visitation_time_id"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatment_times", ["treatment_id"], name: "index_treatment_times_on_treatment_id", using: :btree
  add_index "treatment_times", ["visitation_time_id"], name: "index_treatment_times_on_visitation_time_id", using: :btree

  create_table "treatment_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "treatment_types_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "treatments_count",         default: 0
  end

  add_index "treatment_types", ["name"], name: "index_treatment_types_on_name", unique: true, using: :btree
  add_index "treatment_types", ["treatment_types_group_id"], name: "index_treatment_types_on_treatment_types_group_id", using: :btree

  create_table "treatment_types_groups", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatment_types_groups", ["name"], name: "index_treatment_types_groups_on_name", unique: true, using: :btree

  create_table "treatments", force: :cascade do |t|
    t.integer  "patient_id",                        null: false
    t.integer  "doctor_id",                         null: false
    t.integer  "treatment_type_id",                 null: false
    t.string   "medicine"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patients_count",        default: 0
    t.integer  "doctors_count",         default: 0
    t.integer  "treatment_types_count", default: 0
    t.integer  "start_days"
  end

  add_index "treatments", ["doctor_id"], name: "index_treatments_on_doctor_id", using: :btree
  add_index "treatments", ["patient_id"], name: "index_treatments_on_patient_id", using: :btree
  add_index "treatments", ["treatment_type_id"], name: "index_treatments_on_treatment_type_id", using: :btree

  create_table "visitation_times", force: :cascade do |t|
    t.date   "day",         null: false
    t.string "time_of_day", null: false
  end

  add_foreign_key "doctors", "ordering_units"
  add_foreign_key "treatment_times", "treatments"
  add_foreign_key "treatment_times", "visitation_times"
  add_foreign_key "treatment_types", "treatment_types_groups"
  add_foreign_key "treatments", "doctors"
  add_foreign_key "treatments", "patients"
  add_foreign_key "treatments", "treatment_types"
end
