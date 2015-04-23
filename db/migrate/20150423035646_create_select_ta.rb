class CreateSelectTa < ActiveRecord::Migration
  def change
    create_table :select_ta do |t|
      t.string :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
