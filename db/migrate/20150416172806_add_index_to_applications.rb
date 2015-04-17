class AddIndexToApplications < ActiveRecord::Migration
  def change
  	add_index :applications, :student_id
  end
end
