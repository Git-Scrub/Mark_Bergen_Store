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

ActiveRecord::Schema.define(version: 20161204033510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string   "about_us_description"
    t.string   "image"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "catagories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "catagories_products", id: false, force: :cascade do |t|
    t.integer "catagory_id"
    t.integer "product_id"
    t.index ["catagory_id"], name: "index_catagories_products_on_catagory_id", using: :btree
    t.index ["product_id"], name: "index_catagories_products_on_product_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string   "contact_page_text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "customer_provinces", id: false, force: :cascade do |t|
    t.integer "customer_id"
    t.integer "province_id"
    t.index ["customer_id"], name: "index_customer_provinces_on_customer_id", using: :btree
    t.index ["province_id"], name: "index_customer_provinces_on_province_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "home_address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "city"
    t.integer  "province_id"
    t.integer  "user_id"
    t.integer  "order_id"
    t.index ["order_id"], name: "index_customers_on_order_id", using: :btree
    t.index ["province_id"], name: "index_customers_on_province_id", using: :btree
    t.index ["user_id"], name: "index_customers_on_user_id", using: :btree
  end

  create_table "ip_addresses", force: :cascade do |t|
    t.string   "ip_address"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_item_tables", force: :cascade do |t|
    t.integer "amount_ordered"
    t.float   "tax_rate_used"
    t.float   "price_per_item"
    t.integer "product_id"
    t.integer "order_id"
    t.index ["order_id"], name: "index_order_item_tables_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_item_tables_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "customer_id"
    t.integer  "order_item_table_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["order_item_table_id"], name: "index_orders_on_order_item_table_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "province_code"
    t.integer  "customer_id"
    t.decimal  "gst",           default: "0.0"
    t.decimal  "pst",           default: "0.0"
    t.decimal  "hst",           default: "0.0"
    t.index ["customer_id"], name: "index_provinces_on_customer_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_users_on_customer_id", using: :btree
  end

  add_foreign_key "customers", "orders"
  add_foreign_key "customers", "provinces"
  add_foreign_key "customers", "users"
  add_foreign_key "order_item_tables", "orders"
  add_foreign_key "order_item_tables", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_item_tables"
  add_foreign_key "provinces", "customers"
  add_foreign_key "users", "customers"
end
