class AddColumnPasswordConfirmationToProfessor < ActiveRecord::Migration
  def change
  	add_column :professors, :password_confirmation, :string, :presence => true
  end
end
