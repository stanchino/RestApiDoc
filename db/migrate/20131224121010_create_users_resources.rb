class CreateUsersResources < ActiveRecord::Migration
  def change
    create_table :users_resources do |t|
      t.references :user, index: true
      t.integer :resource_id
      t.string :type
      t.string :role

      t.timestamps
    end
  end
end
