class ChangesAttributeNames < ActiveRecord::Migration
  def change
  	rename_table :app_courses, :application_courses
  end
end
