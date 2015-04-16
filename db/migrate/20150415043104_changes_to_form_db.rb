class ChangesToFormDb < ActiveRecord::Migration
  def change
  	remove_column :applications, :international1, :boolean
  	remove_column :applications, :international2, :boolean
  	remove_column :applications, :international3, :boolean
  	add_column :applications, :international1, :integer
  	add_column :applications, :international2, :integer
  	add_column :applications, :international3, :integer
  end
end
