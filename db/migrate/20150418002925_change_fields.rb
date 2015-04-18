class ChangeFields < ActiveRecord::Migration
  def change
  	  	  	change_column :applications, :orientation_met, :string
  	  	  	change_column :applications, :international1, :string
  	  	  	change_column :applications, :international2, :string
  	  	  	remove_column :applications, :international3, :integer
  end
end
