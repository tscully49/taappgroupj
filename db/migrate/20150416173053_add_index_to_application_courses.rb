class AddIndexToApplicationCourses < ActiveRecord::Migration
  def change
  	add_index :application_courses, :application_id
  	add_index :application_courses, :course_id
  end
end
