class AddIndexToUsersStudentId < ActiveRecord::Migration
  def change
  	add_index :users, :student_id, unique: true
  	remove_index :users, :email
  	add_index :users, :first_name
  	add_index :users, :last_name
  end
end
