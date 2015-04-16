class ChangeColumnInApplications2 < ActiveRecord::Migration
  def change
  	change_column_null :applications, :orientation_met, true
  end
end
