class ChangeNumberToString < ActiveRecord::Migration
  def change
  	change_column :applications, :phone_number, :string
  end
end
