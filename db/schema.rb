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

ActiveRecord::Schema.define(:version => 20111103141651) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_link"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "categories_companies", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "category_id"
  end

  create_table "categories_renews", :id => false, :force => true do |t|
    t.integer "renew_id"
    t.integer "category_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "million"
    t.integer  "xlink"
    t.string   "rod_case"
    t.string   "pred_case"
    t.integer  "rand_city"
    t.string   "friendly_url"
  end

  create_table "cities_1", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "million"
    t.integer  "xlink"
    t.string   "rod_case"
    t.string   "pred_case"
    t.integer  "rand_city"
    t.string   "friendly_url"
  end

  create_table "cities_2", :force => true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "million"
    t.integer  "xlink"
    t.string   "rod_case"
    t.string   "pred_case"
    t.integer  "rand_city"
    t.string   "friendly_url"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.text     "description"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "email"
    t.string   "image_link"
    t.integer  "xlink"
    t.integer  "rand_city"
  end

  create_table "ctmps", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "friendly_url"
    t.string  "name"
    t.string  "pred_case"
    t.string  "rod_case"
    t.integer "region_id"
    t.string  "zip"
    t.integer "million"
  end

  create_table "ctmps_1", :force => true do |t|
    t.string  "name"
    t.string  "friendly_url"
    t.string  "pred_case"
    t.string  "rod_case"
    t.integer "region_id"
    t.string  "zip"
    t.integer "million"
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_link"
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_type"
    t.string   "number"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xlink"
    t.integer  "rand_city"
    t.string   "rod_case"
    t.string   "friendly_url"
  end

  create_table "regions_1", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xlink"
    t.integer  "rand_city"
    t.string   "rod_case"
    t.string   "friendly_url"
  end

  create_table "renews", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.text     "description"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.text     "user_message"
    t.integer  "new"
    t.integer  "company_id"
  end

  create_table "rphones", :force => true do |t|
    t.string   "number"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tmps", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name"
    t.string  "rod_case"
    t.string  "pred_case"
    t.string  "friendly_url"
    t.string  "fed_destrict"
  end

  create_table "tmps_1", :force => true do |t|
    t.string "name"
    t.string "rod_case"
    t.string "pred_case"
    t.string "friendly_url"
    t.string "fed_destrict"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visitors", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "message"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "xlinks", :force => true do |t|
    t.string   "keyword"
    t.integer  "case"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
