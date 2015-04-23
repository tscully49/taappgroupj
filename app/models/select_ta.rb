class SelectTa < ActiveRecord::Base
	has_many :users
	has_many :courses
	validates :student_id, presence: true
	validates :course_id, presence: true
end
