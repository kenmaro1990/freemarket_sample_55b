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

ActiveRecord::Schema.define(version: 20191109144240) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "address_first_name",      null: false
    t.string   "address_last_name",       null: false
    t.string   "address_first_name_kana", null: false
    t.string   "address_last_name_kana",  null: false
    t.string   "postal_code",             null: false
    t.integer  "prefecture_id"
    t.string   "city",                    null: false
    t.string   "block",                   null: false
    t.string   "building"
    t.string   "address_phone_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_brands_on_ancestry", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "customer_id"
    t.string   "card_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "category_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "size_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_sizes_on_category_id", using: :btree
    t.index ["size_id"], name: "index_category_sizes_on_size_id", using: :btree
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.text     "description",     limit: 65535, null: false
    t.string   "price",                         null: false
    t.integer  "seller_id",                     null: false
    t.integer  "buyer_id"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "condition",                     null: false
    t.string   "postage",                       null: false
    t.string   "shipping_method",               null: false
    t.string   "departure_area",                null: false
    t.string   "lead_time",                     null: false
    t.string   "display",                       null: false
    t.string   "order_status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.integer  "size_id"
    t.string   "brand_name"
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_sizes_on_ancestry", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "email",                                             null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "last_name_kana",                                    null: false
    t.string   "phone_number",                                      null: false
    t.text     "self_introduction",      limit: 65535
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "birthyear",                                         null: false
    t.integer  "birthmonth",                                        null: false
    t.integer  "birthday",                                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "category_sizes", "categories"
  add_foreign_key "category_sizes", "sizes"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users"
end
