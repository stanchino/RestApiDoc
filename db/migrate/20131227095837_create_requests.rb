class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.string :method
      t.references :entity, index: true

      t.timestamps
    end
  end
end
