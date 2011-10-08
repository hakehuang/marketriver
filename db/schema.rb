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

ActiveRecord::Schema.define(:version => 20111008124949) do

  create_table "customers", :force => true do |t|
    t.string   "nickname"
    t.string   "phone"
    t.integer  "credits",     :default => 100
    t.string   "maintenance"
    t.boolean  "Status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bank_info"
    t.string   "address"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
    t.integer  "user_id"
    t.integer  "product_id"
  end

  add_index "data_files", ["path"], :name => "index_data_files_on_path", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.string   "status"
    t.integer  "price"
    t.date     "RentablePeriod"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cata_level_1"
    t.string   "cata_level_2"
    t.enum     "sharemode",      :limit => [:for_sale, :for_rent, :for_free], :default => :for_free
  end

  create_table "transactions", :force => true do |t|
    t.date     "trans_stime"
    t.date     "trans_etime"
    t.enum     "status",          :limit => [:borrowing, :confirming, :lenting, :logistic], :default => :borrowing
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "borrow_customer"
    t.integer  "lent_customer"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
