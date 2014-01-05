class AddExpectedToAssertion < ActiveRecord::Migration
  def change
    add_column :assertions, :expected, :string
  end
end
