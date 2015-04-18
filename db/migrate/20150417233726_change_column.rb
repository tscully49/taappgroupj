class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :application_courses, :taugh_teach_take_want, :string
  end
end
