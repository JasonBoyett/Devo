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

ActiveRecord::Schema[7.1].define(version: 2024_04_12_110038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_impressions", force: :cascade do |t|
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_impressions_on_comment_id"
    t.index ["user_id"], name: "index_comment_impressions_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "devotional_id", null: false
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["devotional_id"], name: "index_comments_on_devotional_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "devotionals", force: :cascade do |t|
    t.string "title"
    t.text "scriptures", default: [], array: true
    t.text "body"
    t.boolean "is_markdown"
    t.boolean "is_public"
    t.string "template"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_devotionals_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "follower_id", null: false
    t.bigint "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.bigint "devotional_id", null: false
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user"
    t.index ["devotional_id"], name: "index_impressions_on_devotional_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "default_translation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pictures", default: [], array: true
    t.string "nickname"
    t.string "favorite_verse"
    t.string "email"
    t.string "phone"
  end

  add_foreign_key "comment_impressions", "comments"
  add_foreign_key "comment_impressions", "users"
  add_foreign_key "comments", "devotionals"
  add_foreign_key "comments", "users"
  add_foreign_key "devotionals", "users"
  add_foreign_key "follows", "users", column: "followed_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "impressions", "devotionals"
end
