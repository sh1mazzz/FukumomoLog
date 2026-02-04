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

ActiveRecord::Schema[7.2].define(version: 2026_02_04_122535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_records", force: :cascade do |t|
    t.bigint "sugar_glider_id", null: false
    t.date "record_date", null: false
    t.decimal "cage_temperature", precision: 3, scale: 1, null: false
    t.integer "cage_humidity", null: false
    t.decimal "activity_hours", precision: 3, scale: 1, null: false
    t.integer "food_amount", null: false
    t.integer "snack_amount", null: false
    t.integer "water_amount", null: false
    t.integer "pee_amount", null: false
    t.integer "pee_color", null: false
    t.integer "poop_amount", null: false
    t.integer "poop_shape", null: false
    t.boolean "night_crying", default: false, null: false
    t.boolean "hair_loss", default: false, null: false
    t.boolean "ear_dryness", default: false, null: false
    t.boolean "self_injury", default: false, null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sugar_glider_id", "record_date"], name: "index_daily_records_on_sugar_glider_id_and_record_date", unique: true
    t.index ["sugar_glider_id"], name: "index_daily_records_on_sugar_glider_id"
    t.check_constraint "activity_hours >= 0::numeric AND activity_hours <= 24::numeric", name: "daily_records_activity_hours_range"
    t.check_constraint "cage_temperature >= '-50'::integer::numeric AND cage_temperature <= 50::numeric", name: "daily_records_cage_temperature_range"
    t.check_constraint "mod(activity_hours * 2::numeric, 1::numeric) = 0::numeric", name: "daily_records_activity_hours_half_step"
  end

  create_table "sugar_gliders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "gender", null: false
    t.date "birthday", null: false
    t.decimal "weight", precision: 4, scale: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sugar_gliders_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_records", "sugar_gliders"
  add_foreign_key "sugar_gliders", "users"
end
