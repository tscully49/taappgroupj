class Changefields < ActiveRecord::Migration
  def change
    change_column :applications, :student_id, :string
  end
end
