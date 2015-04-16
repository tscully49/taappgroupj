class ApplicationCourses < ActiveRecord::Base
	belongs_to :application
	belongs_to :course
end
