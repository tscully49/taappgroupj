class AddTimestampsToApplications < ActiveRecord::Migration
  def change
  	add_timestamps :applications
  end
end
