class AddBodyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :body, :text
  end
end
