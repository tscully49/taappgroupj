class Changing < ActiveRecord::Migration
  def change
    change_column :ratings, :stu_id,  :string
  end
end
