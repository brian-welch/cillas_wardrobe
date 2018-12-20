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

ActiveRecord::Schema.define(version: 2018_12_20_091505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_instructions", force: :cascade do |t|
    t.string "copy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "code_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "buyer_first_name"
    t.string "buyer_last_name"
    t.string "buyer_address_line_one"
    t.string "buyer_address_line_two"
    t.string "buyer_city"
    t.string "buyer_state"
    t.string "buyer_country"
    t.string "buyer_post_code"
    t.string "buyer_email"
    t.string "buyer_mobile_number"
    t.string "receiver_first_name"
    t.string "receiver_last_name"
    t.string "reciever_address_line_one"
    t.string "receiver_address_line_two"
    t.string "receiver_city"
    t.string "receiver_state"
    t.string "reciever_country"
    t.string "receiver_post_code"
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.string "code_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_care_instructions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "care_instruction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_instruction_id"], name: "index_product_care_instructions_on_care_instruction_id"
    t.index ["product_id"], name: "index_product_care_instructions_on_product_id"
  end

  create_table "product_materials", force: :cascade do |t|
    t.integer "percent"
    t.bigint "product_id"
    t.bigint "material_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_product_materials_on_material_id"
    t.index ["product_id"], name: "index_product_materials_on_product_id"
  end

  create_table "product_tags", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_tags_on_product_id"
    t.index ["tag_id"], name: "index_product_tags_on_tag_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "sku"
    t.integer "quantity"
    t.string "product_number"
    t.boolean "live_status"
    t.bigint "brand_id"
    t.bigint "size_id"
    t.bigint "pattern_id"
    t.bigint "country_id"
    t.bigint "color_id"
    t.bigint "style_id"
    t.bigint "segment_id"
    t.bigint "main_category_id"
    t.bigint "category_id"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "length"
    t.integer "waist"
    t.json "photos"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["color_id"], name: "index_products_on_color_id"
    t.index ["country_id"], name: "index_products_on_country_id"
    t.index ["main_category_id"], name: "index_products_on_main_category_id"
    t.index ["pattern_id"], name: "index_products_on_pattern_id"
    t.index ["segment_id"], name: "index_products_on_segment_id"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["style_id"], name: "index_products_on_style_id"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.string "code_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_reviews", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.integer "stars"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.date "birthday"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "post_code"
    t.string "mobile_number"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "product_care_instructions", "care_instructions"
  add_foreign_key "product_care_instructions", "products"
  add_foreign_key "product_materials", "materials"
  add_foreign_key "product_materials", "products"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "colors"
  add_foreign_key "products", "countries"
  add_foreign_key "products", "main_categories"
  add_foreign_key "products", "patterns"
  add_foreign_key "products", "segments"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "styles"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "user_reviews", "users"
  add_foreign_key "users", "roles"
end
