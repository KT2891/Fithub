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

ActiveRecord::Schema.define(version: 2023_12_07_063411) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "body_fats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "body_fat"
    t.integer "day_or_night"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_body_fats_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id"
    t.bigint "commnet_id"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commnet_id"], name: "index_comments_on_commnet_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "training_set_id"
    t.text "body"
    t.integer "show_permission", default: 0, null: false
    t.boolean "share_permission", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_set_id"], name: "index_posts_on_training_set_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "followed_id", null: false
    t.bigint "follower_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "training_counts", force: :cascade do |t|
    t.bigint "training_detail_id", null: false
    t.float "weight"
    t.integer "count"
    t.text "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_detail_id"], name: "index_training_counts_on_training_detail_id"
  end

  create_table "training_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "training_menu_id", null: false
    t.bigint "training_set_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_menu_id"], name: "index_training_details_on_training_menu_id"
    t.index ["training_set_id"], name: "index_training_details_on_training_set_id"
    t.index ["user_id"], name: "index_training_details_on_user_id"
  end

  create_table "training_menus", force: :cascade do |t|
    t.string "name"
    t.text "explanation"
    t.boolean "status", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "training_parts", force: :cascade do |t|
    t.bigint "training_menu_id", null: false
    t.integer "training_part"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["training_menu_id"], name: "index_training_parts_on_training_menu_id"
  end

  create_table "training_sets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_training_sets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sex", default: 0, null: false
    t.integer "height"
    t.date "birthday"
    t.integer "status", default: 0, null: false
    t.integer "share_permission", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weights", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "weight"
    t.integer "day_or_night"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_weights_on_user_id"
  end

  add_foreign_key "body_fats", "users"
  add_foreign_key "comments", "commnets"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "posts", "training_sets"
  add_foreign_key "posts", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "training_counts", "training_details"
  add_foreign_key "training_details", "training_menus"
  add_foreign_key "training_details", "training_sets"
  add_foreign_key "training_details", "users"
  add_foreign_key "training_parts", "training_menus"
  add_foreign_key "training_sets", "users"
  add_foreign_key "weights", "users"
end
