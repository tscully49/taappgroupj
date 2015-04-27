class CreateCloseApplications < ActiveRecord::Migration
  def change
    create_table :close_applications do |t|
      t.boolean :closed

      t.timestamps
    end
  end
end
