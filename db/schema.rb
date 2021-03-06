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

ActiveRecord::Schema.define(:version => 20120317041257) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cover_id"
    t.integer  "category_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "qq"
    t.string   "email"
    t.string   "address"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "album_id"
  end

  create_table "productions", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.string   "content",    :limit => 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clothing",   :limit => 1000
    t.string   "makeup",     :limit => 1000
    t.string   "place",      :limit => 1000
    t.string   "service",    :limit => 1000
    t.string   "photos",     :limit => 1000
    t.string   "gift",       :limit => 1000
    t.string   "tip",        :limit => 1000
    t.string   "time",       :limit => 1000
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "pwd"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group"
  end

end
