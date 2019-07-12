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

ActiveRecord::Schema.define(version: 2019_07_12_052959) do

  create_table "addressees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_katakana", null: false
    t.string "last_name_katakana", null: false
    t.string "postal_code", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building"
    t.string "phonenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
    t.index ["user_id"], name: "index_addressees_on_user_id"
  end

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "category_id"
    t.string "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_name"], name: "index_brands_on_brand_name", unique: true
    t.index ["category_id"], name: "index_brands_on_category_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.integer "size_type"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
    t.index ["category_name"], name: "index_categories_on_category_name", unique: true
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comments_on_product_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "article"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "given_point"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "size_text"
    t.integer "size_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "seller_user_id"
    t.bigint "buyer_user_id"
    t.bigint "brand_id"
    t.bigint "category_id"
    t.string "product_name", null: false
    t.text "introduction", null: false
    t.integer "product_size_id"
    t.integer "product_state", null: false
    t.integer "who_pays_shipping_fee", null: false
    t.integer "days_to_ship", null: false
    t.integer "price", null: false
    t.integer "trade_state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "way_to_ship", null: false
    t.integer "prefecture_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["buyer_user_id"], name: "index_products_on_buyer_user_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["seller_user_id"], name: "index_products_on_seller_user_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_katakana", null: false
    t.string "last_name_katakana", null: false
    t.integer "birthday", null: false
    t.string "postal_code"
    t.string "city"
    t.string "address"
    t.string "building"
    t.text "introduction"
    t.string "avatar"
    t.integer "point", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "rater_user_id"
    t.bigint "rated_user_id"
    t.text "comment"
    t.integer "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rated_user_id"], name: "index_rates_on_rated_user_id"
    t.index ["rater_user_id"], name: "index_rates_on_rater_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addressees", "users"
  add_foreign_key "brands", "categories"
  add_foreign_key "comments", "products"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "points", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users", column: "buyer_user_id"
  add_foreign_key "products", "users", column: "seller_user_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "rates", "users", column: "rated_user_id"
  add_foreign_key "rates", "users", column: "rater_user_id"
end
