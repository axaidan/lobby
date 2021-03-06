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

ActiveRecord::Schema.define(version: 2020_04_23_130938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commitment_themes", force: :cascade do |t|
    t.bigint "commitment_id"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commitment_id"], name: "index_commitment_themes_on_commitment_id"
    t.index ["theme_id"], name: "index_commitment_themes_on_theme_id"
  end

  create_table "commitments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forums", force: :cascade do |t|
    t.bigint "commitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commitment_id"], name: "index_forums_on_commitment_id", unique: true
  end

  create_table "ngo_commitments", force: :cascade do |t|
    t.bigint "ngo_id"
    t.bigint "commitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commitment_id"], name: "index_ngo_commitments_on_commitment_id"
    t.index ["ngo_id"], name: "index_ngo_commitments_on_ngo_id"
  end

  create_table "ngo_themes", force: :cascade do |t|
    t.bigint "ngo_id"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ngo_id"], name: "index_ngo_themes_on_ngo_id"
    t.index ["theme_id"], name: "index_ngo_themes_on_theme_id"
  end

  create_table "ngos", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "url"
    t.text "description"
    t.boolean "status"
    t.index ["email"], name: "index_ngos_on_email", unique: true
    t.index ["reset_password_token"], name: "index_ngos_on_reset_password_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "forum_id"
    t.index ["forum_id"], name: "index_posts_on_forum_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_replies_on_post_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "media"
    t.string "sourceable_type"
    t.bigint "sourceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sourceable_type", "sourceable_id"], name: "index_sources_on_sourceable_type_and_sourceable_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_commitments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "commitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commitment_id"], name: "index_user_commitments_on_commitment_id"
    t.index ["user_id"], name: "index_user_commitments_on_user_id"
  end

  create_table "user_themes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_user_themes_on_theme_id"
    t.index ["user_id"], name: "index_user_themes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.boolean "name_display"
    t.string "department"
    t.string "role"
    t.boolean "accept_mails", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "forums", "commitments"
end
