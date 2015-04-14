class AddGradStatusToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :grad_status, :string
  end
end
