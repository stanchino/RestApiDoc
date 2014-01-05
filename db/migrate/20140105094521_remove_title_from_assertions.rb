class RemoveTitleFromAssertions < ActiveRecord::Migration
  def change
    remove_column :assertions, :title
  end
end
