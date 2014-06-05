class AddIdDefaultToWorkTypes < ActiveRecord::Migration
  def change
    add_column :work_types, :is_default, :boolean, :after => :is_active, :default => false
  end
end
