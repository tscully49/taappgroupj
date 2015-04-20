class AddNumTas < ActiveRecord::Migration
  def change
    add_column :courses, :open_spots, :integer
  end
end
