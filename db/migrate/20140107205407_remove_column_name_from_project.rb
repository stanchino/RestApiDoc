class RemoveColumnNameFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :name
  end
end
