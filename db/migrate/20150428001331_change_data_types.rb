class ChangeDataTypes < ActiveRecord::Migration
  def change
    change_column :comments, :stu_id,  :string
  end
end
