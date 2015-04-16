class NameChanges < ActiveRecord::Migration
  def change
  	rename_column :applications, :stu_id, :student_id
  	rename_column :applications, :phd_grade_app, :position_applying_for
  	rename_column :applications, :ant_grad_date, :anticipated_graduation_date
  	rename_column :applications, :miz_email, :mizzou_email
  end
end
