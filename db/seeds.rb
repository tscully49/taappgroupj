# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(admin_name: "John", password: "test", miz_email: "test1@missouri.edu")
Admin.create(admin_name: "Johnn", password: "test", miz_email: "test2@missouri.edu")

User.create(first_name: "Joe", last_name: "Toe", email: "joe@mail.missouri.edu", password: "test", student_id: 14357263)
User.create(first_name: "Thomas", last_name: "Scully", email: "tps9tb@mail.missouri.edu", password: "test", student_id: 76524374)
User.create(first_name: "Tim", last_name: "Burton", email: "burton@mail.missouri.edu", password: "test", student_id: 87656234)
User.create(first_name: "Hank", last_name: "Smith", email: "Smith@mail.missouri.edu", password: "test", student_id: 78674455)
User.create(first_name: "Jonathan", last_name: "Scully", email: "scully@mail.missouri.edu", password: "test", student_id: 98767898)
User.create(first_name: "Dillon", last_name: "Byrne", email: "dillon@mail.missouri.edu", password: "test", student_id: 98372645)
User.create(first_name: "Miley", last_name: "Tucker", email: "Tucker@mail.missouri.edu", password: "test", student_id: 98765432)
User.create(first_name: "Earl", last_name: "Jonson", email: "Jonson@mail.missouri.edu", password: "test", student_id: 99999988)

Professor.create(prof_name: "Joe Guillams", miz_email: "joe@missouri.edu", password: "test")
Professor.create(prof_name: "Grant Scott", miz_email: "Scott@missouri.edu", password: "test")
Professor.create(prof_name: "Justin Schuyler", miz_email: "schuyler@missouri.edu", password: "test")
Professor.create(prof_name: "Test Tester", miz_email: "test@missouri.edu", password: "test")
Professor.create(prof_name: "New Guy", miz_email: "Guy@missouri.edu", password: "test")
Professor.create(prof_name: "Big Joe", miz_email: "Big@missouri.edu", password: "test")
Professor.create(prof_name: "Forest Gump", miz_email: "Forest@missouri.edu", password: "test")
Professor.create(prof_name: "Number Eight", miz_email: "eight@missouri.edu", password: "test")
Professor.create(prof_name: "TJ Oshie", miz_email: "Oshie@missouri.edu", password: "test")
Professor.create(prof_name: "Bob Bobberstein", miz_email: "bob@missouri.edu", password: "test")
Professor.create(prof_name: "Jim Jimbo", miz_email: "jim@missouri.edu", password: "test")


Application.create!(first_name: "Thomas", last_name: "Scully", student_id: 13242432, 
	gpa: 4.0, phone_num: 3245234423, mizzou_email: "tps9tb@mail.missouri.edu", 
	date_of_app: "2012-04-03", anticipated_graduation_date: "2012-03-03", 
	speak_score: "0", orientation_met: "yes", accepted: false, 
	language_assessment: "no", GATO_requirement: "done", position_applying_for: "TA")

Application.create!(first_name: "Tim", last_name: "Burton", student_id: 13342432, 
	gpa: 3.0, phone_num: 3555234423, mizzou_email: "burton@mail.missouri.edu", 
	date_of_app: "2012-04-03", anticipated_graduation_date: "2012-03-03", 
	speak_score: "0", orientation_met: "yes", accepted: false, 
	language_assessment: "no", GATO_requirement: "done", position_applying_for: "PLA")

Application.create!(first_name: "Joe", last_name: "Toe", student_id: 13245532, 
	gpa: 3.9, phone_num: 3245234455, mizzou_email: "jer4ro@mail.missouri.edu", 
	date_of_app: "2012-04-03", anticipated_graduation_date: "2012-03-03", 
	speak_score: "0", orientation_met: "yes", accepted: false, 
	language_assessment: "no", GATO_requirement: "done", position_applying_for: "TA")

Application.create!(first_name: "Hank", last_name: "Smith", student_id: 22242432, 
	gpa: 4.0, phone_num: 3245234423, mizzou_email: "js4fb@mail.missouri.edu", 
	date_of_app: "2012-04-03", anticipated_graduation_date: "2012-03-03", 
	speak_score: "0", orientation_met: "yes", accepted: false, 
	language_assessment: "no", GATO_requirement: "done", position_applying_for: "TA")

Course.create(course_name: "CS 4320", prof_id: 3)
Course.create(course_name: "CS 1050", prof_id: 2)
Course.create(course_name: "CS 2050", prof_id: 5)
Course.create(course_name: "CS 3330", prof_id: 6)
Course.create(course_name: "CS 3050", prof_id: 2)
Course.create(course_name: "CS 4050", prof_id: 8)

ApplicationCourse.create(application_id: 1, course_id: 4, taught_teach_take_want: "teach")
ApplicationCourse.create(application_id: 1, course_id: 2, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 1, course_id: 2, taught_teach_take_want: "want")
ApplicationCourse.create(application_id: 1, course_id: 1, taught_teach_take_want: "teach")
ApplicationCourse.create(application_id: 2, course_id: 2, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 2, course_id: 1, taught_teach_take_want: "want")
ApplicationCourse.create(application_id: 2, course_id: 1, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 2, course_id: 3, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 3, course_id: 5, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 3, course_id: 1, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 3, course_id: 2, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 3, course_id: 1, taught_teach_take_want: "want")
ApplicationCourse.create(application_id: 1, course_id: 3, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 1, course_id: 4, taught_teach_take_want: "take")
ApplicationCourse.create(application_id: 1, course_id: 1, taught_teach_take_want: "take")
