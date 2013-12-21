class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.references :suite, index: true

      t.timestamps
    end
  end
end
