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

ActiveRecord::Schema.define(version: 20150413000434) do

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
>>>>>>> racn88_Sprint2

  create_table "admins", id: false, force: true do |t|
    t.integer "admin_id",               null: false
    t.string  "admin_name", limit: 60,  null: false
    t.string  "password",   limit: 40,  null: false
    t.string  "miz_email",  limit: 100, null: false
  end

  create_table "applications", id: false, force: true do |t|
    t.integer  "app_id",                                               null: false
    t.string   "first_name",       limit: 60
    t.string   "last_name",        limit: 60
    t.integer  "stu_id"
    t.decimal  "gpa",                          precision: 4, scale: 3, null: false
    t.integer  "phone_num",                                            null: false
    t.string   "miz_email",        limit: 100
    t.datetime "time_stamp",                                           null: false
    t.date     "date_of_app",                                          null: false
    t.date     "ant_grad_date",                                        null: false
    t.integer  "speak_score"
    t.string   "semester_of_test", limit: 60
    t.boolean  "orientation_met",                                      null: false
    t.boolean  "international1"
    t.boolean  "international2"
    t.boolean  "international3"
    t.boolean  "accepted"
    t.string   "phd_grade_app",    limit: 10
  end

  create_table "comments", id: false, force: true do |t|
    t.integer  "c_id",                       null: false
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

end
