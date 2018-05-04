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

ActiveRecord::Schema.define(version: 20180504144755) do

  create_table "experience_types", force: :cascade do |t|
    t.string "name",          limit: 255
    t.string "external_name", limit: 255
  end

  create_table "experiences", force: :cascade do |t|
    t.integer "experience_type_id",  limit: 4
    t.integer "experience_types_id", limit: 4
    t.string  "name",                limit: 255
    t.string  "display_name",        limit: 255
  end

  add_index "experiences", ["experience_type_id"], name: "fk_rails_1bb089c54a", using: :btree
  add_index "experiences", ["experience_types_id"], name: "index_experiences_on_experience_types_id", using: :btree

  create_table "experiences_mv_aggregated", force: :cascade do |t|
    t.integer "experience_type_id",    limit: 4
    t.string  "name",                  limit: 255
    t.string  "display_name",          limit: 255
    t.integer "average_days_saved",    limit: 4
    t.integer "average_dollars_saved", limit: 4
  end

  add_index "experiences_mv_aggregated", ["experience_type_id"], name: "fk_rails_1bb089c54a", using: :btree

  create_table "measured_value_aggregations", force: :cascade do |t|
    t.integer "experience_type_id",    limit: 4
    t.integer "experience_types_id",   limit: 4
    t.string  "name",                  limit: 255
    t.string  "display_name",          limit: 255
    t.integer "average_days_saved",    limit: 4
    t.integer "average_dollars_saved", limit: 4
  end

  add_index "measured_value_aggregations", ["experience_type_id"], name: "fk_rails_5db9aa144b", using: :btree
  add_index "measured_value_aggregations", ["experience_types_id"], name: "index_measured_value_aggregations_on_experience_types_id", using: :btree

  create_table "measured_values", force: :cascade do |t|
    t.integer  "experiences_id",  limit: 4
    t.string   "case_id",         limit: 255
    t.integer  "experience_id",   limit: 4
    t.integer  "rating",          limit: 4
    t.integer  "time_saved",      limit: 4
    t.integer  "dollar_impact",   limit: 4
    t.text     "comments",        limit: 65535
    t.boolean  "confidentiality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "measured_values", ["experience_id"], name: "fk_rails_3b24a4524b", using: :btree
  add_index "measured_values", ["experiences_id"], name: "index_measured_values_on_experiences_id", using: :btree

  add_foreign_key "experiences", "experience_types"
  add_foreign_key "experiences_mv_aggregated", "experience_types", name: "fk_rails_1bb089c54a_copy"
  add_foreign_key "measured_value_aggregations", "experience_types"
  add_foreign_key "measured_values", "experiences"
end
