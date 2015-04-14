class AddAdvisorToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :advisor, :string
  end
end
