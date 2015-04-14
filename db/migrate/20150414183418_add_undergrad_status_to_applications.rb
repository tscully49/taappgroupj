class AddUndergradStatusToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :undergrad_status, :string
  end
end
