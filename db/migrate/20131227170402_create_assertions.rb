class CreateAssertions < ActiveRecord::Migration
  def change
    create_table :assertions do |t|
      t.string :title
      t.text :description
      t.string :assignment
      t.string :expectation
      t.text :code

      t.timestamps
    end
  end
end
