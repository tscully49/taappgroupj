class RemoveTimeStampFromApplications < ActiveRecord::Migration
  def change
  	remove_column :applications, :time_stamp, :datetime
  end
end
