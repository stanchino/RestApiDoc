class AddPageToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :page_id, :integer
    add_index :requests, :page_id
  end
end
