class Jdskfljl < ActiveRecord::Migration
  def change
    remove_column :ratings, :prof_id, :float
    add_column :ratings, :prof_id, :float
    remove_column :comments, :professor_id, :float
    add_column :comments, :professor_id, :float
  end
end
