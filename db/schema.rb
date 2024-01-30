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

ActiveRecord::Schema[7.1].define(version: 2024_01_30_215151) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_days", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "day"
    t.date "start_week"
    t.date "end_week"
    t.string "mensage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_active_days_on_user_id"
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "activity_type_id", null: false
    t.string "name"
    t.string "description"
    t.string "tutorial"
    t.string "benefits"
    t.integer "identifier"
    t.integer "intensity"
    t.integer "duartion"
    t.boolean "sport_medical_restriccion"
    t.boolean "sport_muscle_pains"
    t.boolean "general_pain"
    t.boolean "is_hipertension"
    t.boolean "is_asthma"
    t.boolean "is_chest_pain"
    t.boolean "pain_cardiac"
    t.boolean "cardiac_family_pain"
    t.boolean "cholesterol_pain"
    t.boolean "dizzines_pain"
    t.boolean "smoke_pain"
    t.boolean "covid_19"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
  end

  create_table "activity_recomendations", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rating"
    t.index ["activity_id"], name: "index_activity_recomendations_on_activity_id"
    t.index ["user_id"], name: "index_activity_recomendations_on_user_id"
  end

  create_table "activity_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "benefits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "issue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_communities_on_user_id"
  end

  create_table "community_posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.string "issue"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_posts_on_community_id"
    t.index ["user_id"], name: "index_community_posts_on_user_id"
  end

  create_table "push_messages", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "endpoint"
    t.json "keys"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id"
    t.index ["user_id"], name: "index_user_activities_on_user_id"
  end

  create_table "user_parametrizations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "weight"
    t.string "height"
    t.string "imc"
    t.boolean "sport_medical_restriccion"
    t.boolean "sport_muscle_pains"
    t.boolean "general_pain"
    t.boolean "is_hipertension"
    t.boolean "is_asthma"
    t.boolean "is_chest_pain"
    t.boolean "pain_cardiac"
    t.boolean "cardiac_family_pain"
    t.boolean "cholesterol_pain"
    t.boolean "dizzines_pain"
    t.boolean "smoke_pain"
    t.boolean "covid_19"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_parametrizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_push_notifications", force: :cascade do |t|
    t.string "endpoint"
    t.string "auth_key"
    t.string "p256dh_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_web_push_notifications_on_user_id"
  end

  create_table "webpush_subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "endpoint"
    t.json "keys"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_webpush_subscriptions_on_user_id"
  end

  add_foreign_key "active_days", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "activity_types"
  add_foreign_key "activity_recomendations", "activities"
  add_foreign_key "activity_recomendations", "users"
  add_foreign_key "communities", "users"
  add_foreign_key "community_posts", "communities"
  add_foreign_key "community_posts", "users"
  add_foreign_key "user_activities", "activities"
  add_foreign_key "user_activities", "users"
  add_foreign_key "user_parametrizations", "users"
  add_foreign_key "web_push_notifications", "users"
  add_foreign_key "webpush_subscriptions", "users"
end
