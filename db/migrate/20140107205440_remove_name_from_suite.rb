class RemoveNameFromSuite < ActiveRecord::Migration
  def change
    remove_column :suites, :name
  end
end
