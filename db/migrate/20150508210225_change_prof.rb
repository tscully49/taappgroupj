class ChangeProf < ActiveRecord::Migration
  def change
    change_column :comments, :professor_id, :integer
    change_column :ratings, :prof_id, :integer
  end
end
