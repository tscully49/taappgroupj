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

ActiveRecord::Schema.define(version: 20150416131218) do

  create_table "admins", force: true do |t|
    t.string "admin_name", limit: 60,  null: false
    t.string "password",   limit: 40,  null: false
    t.string "miz_email",  limit: 100, null: false
  end

  create_table "app_courses", force: true do |t|
    t.integer  "app_id"
    t.integer  "co_id"
    t.integer  "taught_teach_take_want"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.string   "first_name",                  limit: 60
    t.string   "last_name",                   limit: 60
    t.integer  "student_id"
    t.decimal  "gpa",                                     precision: 4, scale: 3, null: false
    t.integer  "phone_num",                                                       null: false
    t.string   "mizzou_email",                limit: 100
    t.date     "date_of_app"
    t.date     "anticipated_graduation_date",                                     null: false
    t.integer  "speak_score"
    t.string   "semester_of_test",            limit: 60
    t.boolean  "orientation_met"
    t.boolean  "accepted"
    t.string   "position_applying_for",       limit: 10
    t.string   "undergrad_status"
    t.string   "grad_status"
    t.string   "advisor"
    t.string   "other_work"
    t.integer  "international1"
    t.integer  "international2"
    t.integer  "international3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "stu_id",                     null: false
    t.integer  "prof_id",                    null: false
    t.string   "comment",        limit: 500
    t.datetime "time_stamp",                 null: false
    t.date     "date_commented",             null: false
    t.integer  "rating"
  end

  create_table "course_teaches", id: false, force: true do |t|
    t.integer "course_id",                  null: false
    t.integer "app_id",                     null: false
    t.string  "taught_teaching", limit: 10, null: false
  end

  create_table "course_want_profs", id: false, force: true do |t|
    t.integer "course_id",           null: false
    t.integer "app_id",              null: false
    t.string  "grade",     limit: 5, null: false
  end

  create_table "courses", force: true do |t|
    t.integer "prof_id"
    t.string  "course_name", limit: 60, null: false
  end

  create_table "professors", force: true do |t|
    t.string "prof_name", limit: 60,  null: false
    t.string "password",  limit: 40,  null: false
    t.string "miz_email", limit: 100, null: false
  end

  create_table "ratings", id: false, force: true do |t|
    t.integer "prof_id",           null: false
    t.integer "stu_id",            null: false
    t.integer "co_id",             null: false
    t.integer "rating",  limit: 2, null: false
  end

  create_table "students", id: false, force: true do |t|
    t.integer "stu_id",                     null: false
    t.string  "stu_first_name", limit: 60,  null: false
    t.string  "stu_last_name",  limit: 60,  null: false
    t.string  "password",       limit: 40,  null: false
    t.string  "miz_email",      limit: 100, null: false
    t.integer "avg_rating",     limit: 2
    t.string  "student_type",   limit: 10,  null: false
  end

  create_table "user_auths", id: false, force: true do |t|
    t.string   "miz_email",          limit: 100, null: false
    t.string   "encrypted_password", limit: 40,  null: false
    t.string   "salt",               limit: 40,  null: false
    t.datetime "registration_date",              null: false
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "student_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["first_name"], name: "index_users_on_first_name"
  add_index "users", ["last_name"], name: "index_users_on_last_name"
  add_index "users", ["student_id"], name: "index_users_on_student_id", unique: true

end
