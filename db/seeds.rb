# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Joe", last_name: "Toe", email: "joe@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Thomas", last_name: "Scully", email: "tps9tb@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Tim", last_name: "Burton", email: "burton@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Hank", last_name: "Smith", email: "Smith@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Jonathan", last_name: "Scully", email: "scully@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Dillon", last_name: "Byrn", email: "dillon@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Miley", last_name: "Tucker", email: "Tucker@mail.missouri.edu", password: "test", password_confirmation: "test")
User.create(first_name: "Earl", last_name: "Jonson", email: "Jonson@mail.missouri.edu", password: "test", password_confirmation: "test")

Professor.create(prof_name: "Joe Guillams", miz_email: "joe@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Grant Scott", miz_email: "Scott@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Justin Schuyler", miz_email: "schuyler@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Test Tester", miz_email: "test@mail.missouri.edu", password: "test")
Professor.create(prof_name: "New Guy", miz_email: "Guy@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Big Joe", miz_email: "Big@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Forest Gump", miz_email: "Forest@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Number Eight", miz_email: "eight@mail.missouri.edu", password: "test")
Professor.create(prof_name: "TJ Oshie", miz_email: "Oshie@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Bob Bobberstein", miz_email: "bob@mail.missouri.edu", password: "test")
Professor.create(prof_name: "Jim Jimbo", miz_email: "jim@mail.missouri.edu", password: "test")


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

