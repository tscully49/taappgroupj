class AddOtherWorkToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :other_work, :string
  end
end
