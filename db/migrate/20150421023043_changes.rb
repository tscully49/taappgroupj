class Changes < ActiveRecord::Migration
  def change
  	rename_column :courses, :prof_id, :professor_id
  end
end
