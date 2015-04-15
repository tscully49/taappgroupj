class ChangeUsersTable < ActiveRecord::Migration
  def change
  	remove_column :users, :name, :string
  	drop_table :students
  end
end
