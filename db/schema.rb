# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_13_102026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "answer", null: false
    t.bigint "user_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_answers_on_artist_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name"
    t.string "artist_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_bookmarks_on_answer_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "festivals", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "prefecture", null: false
    t.string "region", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "artists"
  add_foreign_key "answers", "users"
  add_foreign_key "bookmarks", "answers"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "posts", "users"
end
