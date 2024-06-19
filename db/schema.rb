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

ActiveRecord::Schema[7.1].define(version: 2024_05_22_231918) do
  create_table "activities", force: :cascade do |t|
    t.string "reason"
    t.integer "s_attendance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["s_attendance_id"], name: "index_activities_on_s_attendance_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "s_attendances", force: :cascade do |t|
    t.datetime "time_in"
    t.datetime "time_out"
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_s_attendances_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.integer "usn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course"
    t.integer "year"
    t.date "birth_day"
  end

  add_foreign_key "activities", "s_attendances"
  add_foreign_key "s_attendances", "students"
end
