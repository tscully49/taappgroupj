class CreateAppCourses < ActiveRecord::Migration
  def change
    create_table :app_courses do |t|
      t.integer :app_id
      t.integer :co_id
      t.integer :taught_teach_take_want

      t.timestamps
    end
  end
end
