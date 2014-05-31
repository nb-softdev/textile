class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.string :name
      t.text :description
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
