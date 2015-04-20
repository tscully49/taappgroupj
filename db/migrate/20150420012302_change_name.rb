class ChangeName < ActiveRecord::Migration
  def change
    rename_column :professors, :password, :password_digest
  end
end
