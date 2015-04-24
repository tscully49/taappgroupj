class ChangeNumberToString < ActiveRecord::Migration
  def change
  	change_column :applications, :phone_num, :string
  end
end
