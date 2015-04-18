class ChangeColumn2 < ActiveRecord::Migration
  def change
  	  	change_column :application_courses, :taught_teach_take_want, :string
  end
end
