class RenameMethodToActionOnRequest < ActiveRecord::Migration
  def change
    rename_column :requests, :method, :action
  end
end
