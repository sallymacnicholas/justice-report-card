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

ActiveRecord::Schema.define(version: 20161210025350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "issue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["issue_id"], name: "index_categories_on_issue_id", using: :btree
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_divisions_on_region_id", using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "legislations", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "link"
    t.integer  "issue_id"
    t.string   "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "state_id"
    t.index ["issue_id"], name: "index_legislations_on_issue_id", using: :btree
    t.index ["state_id"], name: "index_legislations_on_state_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "division_id"
    t.index ["division_id"], name: "index_states_on_division_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  create_table "subcategory_scores", force: :cascade do |t|
    t.integer  "subcategory_id"
    t.integer  "state_id"
    t.integer  "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["state_id"], name: "index_subcategory_scores_on_state_id", using: :btree
    t.index ["subcategory_id"], name: "index_subcategory_scores_on_subcategory_id", using: :btree
  end

  add_foreign_key "divisions", "regions"
  add_foreign_key "legislations", "issues"
  add_foreign_key "legislations", "states"
  add_foreign_key "states", "divisions"
  add_foreign_key "subcategory_scores", "states"
  add_foreign_key "subcategory_scores", "subcategories"
end
