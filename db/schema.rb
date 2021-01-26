# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_26_042145) do

  create_table "concerts", force: :cascade do |t|
    t.string "concert_name"
    t.date "concert_date"
    t.integer "number_of_people"
    t.integer "duration"
    t.integer "Group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Group_id"], name: "index_concerts_on_Group_id"
  end

  create_table "crews", force: :cascade do |t|
    t.string "name"
    t.integer "Group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Group_id"], name: "index_crews_on_Group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.date "debut_date"
    t.integer "number_of_members"
    t.integer "type_of_band"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "concerts", "Groups"
  add_foreign_key "crews", "Groups"
end
