class ChangingTable < ActiveRecord::Migration
  def change
  	remove_column :applications, :position_applying_for, :string
  	add_column :applications, :position_applying_for, :string
  end
end
