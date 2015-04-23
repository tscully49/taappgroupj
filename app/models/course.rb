class Course < ActiveRecord::Base
	validates :professor_id,  presence: true
	has_many :application_courses
	has_many :users, through: :select_ta
	has_many :applications, through: :application_courses
	has_one :professor
end