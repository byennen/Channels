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

ActiveRecord::Schema.define(:version => 20120802193409) do

  create_table "ads", :force => true do |t|
    t.integer  "channel_id"
    t.boolean  "published"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "albums", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "image_uid"
    t.boolean  "active"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "slug"
  end

  add_index "albums", ["slug"], :name => "index_albums_on_slug"

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "subdomain"
    t.string   "background_image_uid"
    t.string   "banner_image_uid"
    t.string   "background_color"
    t.string   "google_analytics_key"
    t.string   "facebook_page"
    t.string   "twitter_id"
    t.string   "google_plus_page"
    t.boolean  "active"
  end

  create_table "facebook_pages", :force => true do |t|
    t.integer  "channel_id"
    t.string   "page_id"
    t.string   "name"
    t.string   "access_token"
    t.string   "category"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "giveaways", :force => true do |t|
    t.string   "email"
    t.boolean  "derby",      :default => false
    t.boolean  "cma",        :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "photo_albums", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image_uid"
    t.string   "slug"
  end

  add_index "photo_albums", ["slug"], :name => "index_photo_albums_on_slug"

  create_table "photos", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "paid"
    t.boolean  "active"
    t.string   "image_uid"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "photo_album_id"
  end

  create_table "posts", :force => true do |t|
    t.integer  "channel_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.text     "description"
    t.date     "publish_on"
    t.string   "feature"
    t.string   "link"
    t.string   "location"
    t.string   "logo_uid"
    t.date     "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "photo_id"
    t.integer  "video_id"
    t.string   "slug"
  end

  add_index "posts", ["slug"], :name => "index_posts_on_slug"

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "active"
    t.integer  "album_id"
    t.integer  "price_in_cents"
    t.string   "preview"
    t.string   "song"
    t.string   "slug"
  end

  add_index "songs", ["slug"], :name => "index_songs_on_slug"

  create_table "uploads", :force => true do |t|
    t.string   "file_name"
    t.string   "file_type"
    t.string   "file_size"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "preview"
  end

  add_index "uploads", ["uploadable_id", "uploadable_type"], :name => "index_uploads_on_uploadable_id_and_uploadable_type"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
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
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.integer  "channel_id"
    t.string   "stripe_customer_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "new_fb_user",            :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "channel_id"
    t.string   "title"
    t.text     "description"
    t.string   "image_uid"
    t.boolean  "paid"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "video"
    t.string   "preview"
    t.string   "zencoder_output_id"
    t.boolean  "processed"
    t.string   "slug"
    t.datetime "publish_on"
  end

  add_index "videos", ["slug"], :name => "index_videos_on_slug"

end
