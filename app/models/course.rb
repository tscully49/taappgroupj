class Course < ActiveRecord::Base
	has_many :application_courses
	has_many :applications, through: :application_courses
	belongs_to :professor
end