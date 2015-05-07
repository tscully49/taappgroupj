class AddProfIdToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :prof_id, :professor_id
    change_column :comments, :professor_id, :string
  end
end
