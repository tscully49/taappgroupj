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

ActiveRecord::Schema.define(version: 20150412224837) do

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin", id: false, force: true do |t|
    t.integer "admin_id",               null: false
    t.string  "admin_name", limit: 60,  null: false
    t.string  "password",   limit: 40,  null: false
    t.string  "miz_email",  limit: 100, null: false
  end

# Could not dump table "applications" because of following StandardError
#   Unknown type 'stutype' for column 'phd_grade_app'

  create_table "comments", id: false, force: true do |t|
    t.integer  "c_id",                       null: false
    t.integer  "stu_id",                     null: false
    t.integer  "prof_id",                    null: false
    t.string   "comment",        limit: 500
    t.datetime "time_stamp",                 null: false
    t.date     "date_commented",             null: false
    t.integer  "rating"
  end

# Could not dump table "course_teach" because of following StandardError
#   Unknown type 'taughtorteach' for column 'taught_teaching'

# Could not dump table "course_want_prof" because of following StandardError
#   Unknown type 'gradetype' for column 'grade'

  create_table "courses", id: false, force: true do |t|
    t.integer "co_id",                  null: false
    t.integer "prof_id"
    t.string  "course_name", limit: 60, null: false
  end

  create_table "professors", id: false, force: true do |t|
    t.integer "prof_id",               null: false
    t.string  "prof_name", limit: 60,  null: false
    t.string  "password",  limit: 40,  null: false
    t.string  "miz_email", limit: 100, null: false
  end

  create_table "ratings", id: false, force: true do |t|
    t.integer "prof_id",           null: false
    t.integer "stu_id",            null: false
    t.integer "co_id",             null: false
    t.integer "rating",  limit: 2, null: false
  end

# Could not dump table "students" because of following StandardError
#   Unknown type 'stutype' for column 'student_type'

  create_table "user_auth", id: false, force: true do |t|
    t.string   "miz_email",          limit: 100,                   null: false
    t.string   "encrypted_password", limit: 40,                    null: false
    t.string   "salt",               limit: 40,                    null: false
    t.datetime "registration_date",              default: "now()", null: false
  end

end
