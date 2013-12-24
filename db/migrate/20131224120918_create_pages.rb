class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :title
      t.text :description
      t.boolean :published
      t.integer :order
      t.references :suite, index: true

      t.timestamps
    end
  end
end
