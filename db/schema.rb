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

ActiveRecord::Schema.define(version: 20151212192714) do

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.boolean  "unread"
    t.integer  "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "read_time"
    t.text     "images"
  end

  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id"

  create_table "messages_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
  end

  add_index "messages_users", ["message_id"], name: "index_messages_users_on_message_id"
  add_index "messages_users", ["user_id"], name: "index_messages_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
