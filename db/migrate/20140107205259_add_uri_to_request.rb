class AddUriToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :uri, :string
  end
end
