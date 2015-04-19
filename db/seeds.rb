# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(first_name:  "Example",
             last_name:  "User",
             email: "example@mail.missouri.edu",
             student_id: 12345678,
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  first_name  = Faker::Name.name
  last_name   = Faker::Name.name
  student_id  = 12345678.n,
  email = "example-#{n+1}@mail.missouri.edu"
  password = "password"
  User.create!(fisrt_name:  name,
               last_name: name,
               student_id: student_id,
               email: email,
               
               password:              password,
               password_confirmation: password)
end

