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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2021_02_17_010310) do
=======
ActiveRecord::Schema.define(version: 2021_02_17_053516) do
>>>>>>> origin/develop

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "phone_number", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "ordered_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "count"
    t.integer "tax_included_price"
    t.integer "production_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "shipping_cost"
    t.integer "total_payment"
    t.integer "how_to_pay", default: 0
    t.integer "order_status", default: 0
    t.string "postal_code"
    t.string "address"
    t.string "receiver_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_type_id"
    t.string "name"
    t.text "description"
    t.integer "price"
    t.text "image_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receivers", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.string "postal_code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
