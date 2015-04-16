class ChangeColumnInApplications < ActiveRecord::Migration
  def change
  	change_column_null :applications, :date_of_app, true
  end
end
