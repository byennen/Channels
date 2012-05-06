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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120504232354) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "subdomain"
    t.string   "background_image_uid"
    t.string   "banner_image_uid"
  end

  create_table "features", :force => true do |t|
    t.integer  "channel_id"
    t.boolean  "audio"
    t.boolean  "vault"
    t.boolean  "news"
    t.boolean  "events"
    t.boolean  "giving"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "giveaways", :force => true do |t|
    t.string   "email"
    t.boolean  "derby",      :default => false
    t.boolean  "cma",        :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "paid"
    t.boolean  "active"
    t.string   "image_uid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "songs", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.string   "album"
    t.decimal  "song_price",   :precision => 10, :scale => 0
    t.decimal  "album_price",  :precision => 10, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "filename"
    t.string   "file_preview"
    t.boolean  "active"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.integer  "channel_id"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
