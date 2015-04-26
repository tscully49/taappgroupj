class ChangeDataType < ActiveRecord::Migration
  def change
  	change_column :admins, :password_digest, :string, :limit => nil
  	change_column :professors, :password_digest, :string, :limit => nil
  end
end
