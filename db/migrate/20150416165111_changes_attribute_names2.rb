class ChangesAttributeNames2 < ActiveRecord::Migration
  def change
  	rename_column :application_courses, :app_id, :application_id
  	rename_column :application_courses, :co_id, :course_id
  end
end
