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

ActiveRecord::Schema.define(version: 2020_06_12_152723) do

  create_table "chat_messages", force: :cascade do |t|
    t.string "text"
    t.integer "user_id"
    t.integer "chat_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_id"], name: "index_chat_messages_on_chat_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

# Could not dump table "chats" because of following StandardError
#   Unknown type 'queue' for column 'users'

  create_table "chats_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "chat_id"
    t.index ["chat_id"], name: "index_chats_users_on_chat_id"
    t.index ["user_id"], name: "index_chats_users_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipient"
    t.string "author"
    t.string "chatkey"
    t.index ["author"], name: "index_posts_on_author"
    t.index ["chatkey"], name: "index_posts_on_chatkey"
    t.index ["recipient"], name: "index_posts_on_recipient"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'Fixnum' for column 'radius'

  add_foreign_key "chat_messages", "chats"
  add_foreign_key "chat_messages", "users"
end
