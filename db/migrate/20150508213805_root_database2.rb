class RootDatabase2 < ActiveRecord::Migration
  def change
    ActiveRecord::Schema.define(version: 20150508212816) do

  create_table "admins", force: true do |t|
    t.string "admin_name",      limit: 60,  null: false
    t.string "password_digest",             null: false
    t.string "miz_email",       limit: 100, null: false
  end

  create_table "application_courses", force: true do |t|
    t.integer  "application_id"
    t.integer  "course_id"
    t.string   "taught_teach_take_want"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "application_courses", ["application_id"], name: "index_application_courses_on_application_id"
  add_index "application_courses", ["course_id"], name: "index_application_courses_on_course_id"

  create_table "applications", force: true do |t|
    t.string   "first_name",                  limit: 60
    t.string   "last_name",                   limit: 60
    t.string   "student_id"
    t.decimal  "gpa",                                     precision: 4, scale: 3, null: false
    t.string   "phone_num",                                                       null: false
    t.string   "mizzou_email",                limit: 100
    t.date     "date_of_app"
    t.date     "anticipated_graduation_date",                                     null: false
    t.integer  "speak_score"
    t.string   "semester_of_test",            limit: 60
    t.string   "orientation_met"
    t.boolean  "accepted"
    t.string   "undergrad_status"
    t.string   "grad_status"
    t.string   "advisor"
    t.string   "other_work"
    t.string   "language_assessment"
    t.string   "GATO_requirement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position_applying_for"
    t.integer  "course_id"
  end

  add_index "applications", ["student_id"], name: "index_applications_on_student_id"

  create_table "close_applications", force: true do |t|
    t.boolean  "closed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "stu_id",                     null: false
    t.string   "comment",        limit: 500
    t.datetime "time_stamp",                 null: false
    t.date     "date_commented",             null: false
    t.integer  "rating"
    t.float    "professor_id"
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
    t.integer "professor_id"
    t.string  "course_name",  limit: 60, null: false
    t.integer "open_spots"
  end

  create_table "finalizeds", force: true do |t|
    t.boolean  "finalized"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", force: true do |t|
    t.string "prof_name",             limit: 60,  null: false
    t.string "password_digest",                   null: false
    t.string "miz_email",             limit: 100, null: false
    t.string "password_confirmation"
  end

  create_table "ratings", id: false, force: true do |t|
    t.string  "stu_id",            null: false
    t.integer "rating",  limit: 2, null: false
    t.float   "prof_id"
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
  end
end
