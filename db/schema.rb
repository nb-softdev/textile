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

ActiveRecord::Schema.define(version: 20140619190538) do

  create_table "album_products", force: true do |t|
    t.integer  "album_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "albums", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.integer  "market_id"
    t.string   "name"
    t.text     "description"
    t.string   "sub_domain"
    t.string   "custom_domain"
    t.string   "contact_person"
    t.string   "mobile_1"
    t.string   "mobile_2"
    t.string   "mobile_3"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "phone_3"
    t.text     "address"
    t.string   "what_i_do_label",      default: "What I Do"
    t.string   "who_i_am_label",       default: "Who I Am"
    t.string   "my_work_label",        default: "My Work"
    t.text     "what_i_do_desc"
    t.text     "who_i_am_desc"
    t.text     "my_work_desc"
    t.string   "footer_content",       default: "© 2014 Textile"
    t.boolean  "is_active",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
  end

  create_table "company_layouts", force: true do |t|
    t.integer  "company_id"
    t.integer  "company_layout_id"
    t.string   "theme_name"
    t.string   "theme_type"
    t.string   "header_background_color"
    t.string   "header_text_background_color"
    t.string   "home_background_color"
    t.string   "what_i_do_background_color"
    t.string   "who_i_am_background_color"
    t.string   "my_work_background_color"
    t.string   "album_background_color"
    t.string   "album_sidebar_background_color"
    t.string   "contact_us_background_color"
    t.string   "footer_background_color"
    t.string   "logo_font_color"
    t.string   "header_font_color"
    t.string   "home_name_font_color"
    t.string   "home_description_font_color"
    t.string   "what_i_do_name_font_color"
    t.string   "what_i_do_description_font_color"
    t.string   "who_i_am_name_font_color"
    t.string   "who_i_am_description_font_color"
    t.string   "album_name_font_color"
    t.string   "album_description_font_color"
    t.string   "my_work_name_font_color"
    t.string   "my_work_description_font_color"
    t.string   "contact_us_name_font_color"
    t.string   "contact_us_description_font_color"
    t.string   "footer_font_color"
    t.string   "header_font"
    t.string   "home_name_font"
    t.string   "home_description_font"
    t.string   "what_i_do_name_font"
    t.string   "what_i_do_description_font"
    t.string   "who_i_am_name_font"
    t.string   "who_i_am_description_font"
    t.string   "album_name_font"
    t.string   "album_description_font"
    t.string   "my_work_name_font"
    t.string   "my_work_description_font"
    t.string   "contact_us_name_font"
    t.string   "contact_us_description_font"
    t.string   "footer_font"
    t.string   "logo_font_family"
    t.string   "header_font_family"
    t.string   "home_name_font_family"
    t.string   "home_description_font_family"
    t.string   "what_i_do_name_font_family"
    t.string   "what_i_do_description_font_family"
    t.string   "who_i_am_name_font_family"
    t.string   "who_i_am_description_font_family"
    t.string   "album_name_font_family"
    t.string   "album_description_font_family"
    t.string   "my_work_name_font_family"
    t.string   "my_work_description_font_family"
    t.string   "contact_us_name_font_family"
    t.string   "contact_us_description_font_family"
    t.string   "footer_font_family"
    t.string   "logo_font_size"
    t.string   "header_font_size"
    t.string   "home_name_font_size"
    t.string   "home_description_font_size"
    t.string   "what_i_do_name_font_size"
    t.string   "what_i_do_description_font_size"
    t.string   "who_i_am_name_font_size"
    t.string   "who_i_am_description_font_size"
    t.string   "album_name_font_size"
    t.string   "album_description_font_size"
    t.string   "my_work_name_font_size"
    t.string   "my_work_description_font_size"
    t.string   "contact_us_name_font_size"
    t.string   "contact_us_description_font_size"
    t.string   "footer_font_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "front_background1_file_name"
    t.string   "front_background1_content_type"
    t.integer  "front_background1_file_size"
    t.datetime "front_background1_updated_at"
    t.string   "front_background2_file_name"
    t.string   "front_background2_content_type"
    t.integer  "front_background2_file_size"
    t.datetime "front_background2_updated_at"
    t.string   "front_background3_file_name"
    t.string   "front_background3_content_type"
    t.integer  "front_background3_file_size"
    t.datetime "front_background3_updated_at"
    t.string   "front_background4_file_name"
    t.string   "front_background4_content_type"
    t.integer  "front_background4_file_size"
    t.datetime "front_background4_updated_at"
  end

  create_table "company_users", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.string   "role",       default: "MANAGER"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_work_types", force: true do |t|
    t.integer  "company_id"
    t.integer  "work_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_us", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "city"
    t.string   "area"
    t.integer  "pincode"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_active",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "company_id"
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.float    "price",              default: 0.0
    t.boolean  "is_active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: ""
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_active",              default: true
    t.boolean  "is_admin",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_active",   default: true
    t.boolean  "is_default",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
