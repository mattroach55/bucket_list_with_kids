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

ActiveRecord::Schema.define(version: 20180307151131) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string "name"
    t.string "entity"
    t.boolean "show"
    t.string "description"
    t.string "street_number"
    t.string "street"
    t.string "locality"
    t.string "country"
    t.string "region"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.string "holiday_type"
    t.string "theme"
    t.integer "kids_age_from"
    t.integer "kids_age_to"
    t.integer "duration"
    t.float "price"
    t.boolean "kids_club"
    t.boolean "kids_menu"
    t.boolean "connecting_rooms"
    t.boolean "pool"
    t.boolean "beach"
    t.integer "bucket_list_count"
    t.integer "average_review_score"
    t.string "booking_link"
    t.bigint "destination_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_accommodations_on_destination_id"
    t.index ["user_id"], name: "index_accommodations_on_user_id"
  end

  create_table "bucket_list_items", force: :cascade do |t|
    t.bigint "accommodation_id"
    t.bigint "experience_id"
    t.bigint "user_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_bucket_list_items_on_accommodation_id"
    t.index ["destination_id"], name: "index_bucket_list_items_on_destination_id"
    t.index ["experience_id"], name: "index_bucket_list_items_on_experience_id"
    t.index ["user_id"], name: "index_bucket_list_items_on_user_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "entity"
    t.boolean "show"
    t.string "description"
    t.string "street_number"
    t.string "street"
    t.string "locality"
    t.string "country"
    t.string "region"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.string "holiday_type"
    t.string "theme"
    t.integer "kids_age_from"
    t.integer "kids_age_to"
    t.integer "duration"
    t.float "price"
    t.boolean "kids_club"
    t.boolean "kids_menu"
    t.boolean "connecting_rooms"
    t.boolean "pool"
    t.boolean "beach"
    t.integer "bucket_list_count"
    t.integer "average_review_score"
    t.string "booking_link"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.string "entity"
    t.boolean "show"
    t.string "description"
    t.string "street_number"
    t.string "street"
    t.string "locality"
    t.string "country"
    t.string "region"
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.string "holiday_type"
    t.string "theme"
    t.integer "kids_age_from"
    t.integer "kids_age_to"
    t.integer "duration"
    t.float "price"
    t.boolean "kids_club"
    t.boolean "kids_menu"
    t.boolean "connecting_rooms"
    t.boolean "pool"
    t.boolean "beach"
    t.integer "bucket_list_count"
    t.integer "average_review_score"
    t.string "booking_link"
    t.bigint "destination_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_experiences_on_destination_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "description"
    t.integer "rating", default: 0, null: false
    t.bigint "accommodation_id"
    t.bigint "experience_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accommodation_id"], name: "index_reviews_on_accommodation_id"
    t.index ["experience_id"], name: "index_reviews_on_experience_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "photo"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "accommodations", "destinations"
  add_foreign_key "accommodations", "users"
  add_foreign_key "bucket_list_items", "accommodations"
  add_foreign_key "bucket_list_items", "destinations"
  add_foreign_key "bucket_list_items", "experiences"
  add_foreign_key "bucket_list_items", "users"
  add_foreign_key "destinations", "users"
  add_foreign_key "experiences", "destinations"
  add_foreign_key "experiences", "users"
  add_foreign_key "reviews", "accommodations"
  add_foreign_key "reviews", "experiences"
  add_foreign_key "reviews", "users"
end
