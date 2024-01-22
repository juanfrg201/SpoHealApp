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

ActiveRecord::Schema[7.1].define(version: 2024_01_22_170829) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sport_users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "user_parametrizations", "users"
end
