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

ActiveRecord::Schema.define(version: 2020_03_10_204053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.string "location"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "venue_name"
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["organisation_id"], name: "index_experiences_on_organisation_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_orders_on_experience_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organisations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_reviews_on_order_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "experiences", "organisations"
  add_foreign_key "orders", "experiences"
  add_foreign_key "orders", "users"
  add_foreign_key "organisations", "users"
  add_foreign_key "reviews", "orders"
end
