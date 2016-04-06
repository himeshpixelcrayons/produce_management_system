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

ActiveRecord::Schema.define(version: 20160406070018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cashiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "landline"
    t.string   "cellphone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "order_id"
    t.date     "date_delivered"
    t.string   "payment_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "delivery_id"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "price"
    t.float    "weight"
    t.float    "amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "orderable_id"
    t.string   "orderable_type"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.float    "amount_delivered"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "customer_id"
    t.float    "amount_received"
    t.boolean  "is_delivered",     default: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_active",  default: true
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "quantity"
    t.integer  "product_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "price"
    t.string   "unit_of_quantity"
    t.float    "weight"
  end

  create_table "purchase_order_items", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.integer  "vendor_product_id"
    t.integer  "items_ordered"
    t.integer  "items_received"
    t.float    "items_rejected"
    t.text     "reject_reason"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.date     "date"
    t.date     "due_date"
    t.boolean  "is_outstanding"
    t.integer  "vendor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendor_products", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.string   "unit_of_quantity"
    t.integer  "vendor_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "quantity"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "street"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.string   "zip"
    t.string   "country"
    t.string   "landline"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
