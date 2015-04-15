class ChangeCommentsTable < ActiveRecord::Migration
  def change
  	remove_column :comments, :c_id, :string
  	add_column :comments, :id, :primary_key
  end
end
