class Course < ActiveRecord::Base
	validates :prof_id,  presence: true
	has_many :application_courses
	has_many :applications, through: :application_courses
	belongs_to :professor
end