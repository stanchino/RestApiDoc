class CreateSuites < ActiveRecord::Migration
  def change
    create_table :suites do |t|
      t.string :name
      t.string :title
      t.text :description
      t.boolean :published
      t.integer :order
      t.references :project, index: true

      t.timestamps
    end
  end
end
