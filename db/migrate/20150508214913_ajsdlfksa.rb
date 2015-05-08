class Ajsdlfksa < ActiveRecord::Migration
  def change
    remove_column :comments, :professor_id, :float
    add_column :comments, :professor_id, :integer
    remove_column :ratings, :prof_id, :float
    add_column :ratings, :prof_id, :integer
  end
end
