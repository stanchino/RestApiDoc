class RemoveCodeFromAssertion < ActiveRecord::Migration
  def change
    remove_column :assertions, :code
  end
end
