class AddConditionToAssertion < ActiveRecord::Migration
  def change
    add_column :assertions, :condition, :string
  end
end
