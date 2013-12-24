class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :title
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
