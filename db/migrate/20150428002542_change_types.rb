class ChangeTypes < ActiveRecord::Migration
  def change
    remove_column :ratings, :co_id, :integer
    change_column :ratings, :prof_id, :string
  end
end
