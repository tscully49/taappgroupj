class AddColumnCourseToApplication < ActiveRecord::Migration
  def change
  	add_column :applications, :course_id, :integer 
  end
end
