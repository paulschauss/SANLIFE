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

ActiveRecord::Schema.define(version: 2022_02_28_145049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "illness_nutrients", force: :cascade do |t|
    t.bigint "nutrient_id", null: false
    t.bigint "illness_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["illness_id"], name: "index_illness_nutrients_on_illness_id"
    t.index ["nutrient_id"], name: "index_illness_nutrients_on_nutrient_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nutrient_foods", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "nutrient_id", null: false
    t.integer "measure_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_nutrient_foods_on_food_id"
    t.index ["nutrient_id"], name: "index_nutrient_foods_on_nutrient_id"
  end

  create_table "nutrients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_illnesses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "illness_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["illness_id"], name: "index_user_illnesses_on_illness_id"
    t.index ["user_id"], name: "index_user_illnesses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "illness_nutrients", "illnesses"
  add_foreign_key "illness_nutrients", "nutrients"
  add_foreign_key "nutrient_foods", "foods"
  add_foreign_key "nutrient_foods", "nutrients"
  add_foreign_key "user_illnesses", "illnesses"
  add_foreign_key "user_illnesses", "users"
end
