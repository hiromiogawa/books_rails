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

ActiveRecord::Schema.define(version: 2020_02_15_142201) do

  create_table "items", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.string "author"
    t.string "image_url"
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.string "type"
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.string "statsu"
    t.string "media"
    t.text "memo"
    t.text "imp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_ownerships_on_item_id"
    t.index ["user_id", "item_id", "type"], name: "index_ownerships_on_user_id_and_item_id_and_type", unique: true
    t.index ["user_id"], name: "index_ownerships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "ownerships", "items"
  add_foreign_key "ownerships", "users"
end
