class CreateFinalizeds < ActiveRecord::Migration
  def change
    create_table :finalizeds do |t|
      t.boolean :finalized

      t.timestamps
    end
  end
end
