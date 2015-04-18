class ChangeFields3 < ActiveRecord::Migration
  def change
  	rename_column :applications, :international1, :language_assessment
  	rename_column :applications, :international2, :GATO_requirement
  end
end
