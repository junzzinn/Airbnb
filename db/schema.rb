# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_16_193256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "residence_id", null: false
    t.bigint "user_id", null: false
    t.decimal "total_price"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residence_id"], name: "index_bookings_on_residence_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_chats_on_booking_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "comment"
    t.integer "value"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_ratings_on_booking_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "residences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "description"
    t.string "image"
    t.string "address"
    t.decimal "price_per_night"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_residences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password"
  end

  add_foreign_key "bookings", "residences"
  add_foreign_key "bookings", "users"
  add_foreign_key "chats", "bookings"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "ratings", "bookings"
  add_foreign_key "ratings", "users"
  add_foreign_key "residences", "users"
end
