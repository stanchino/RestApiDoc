class AddRequestIdToAssertion < ActiveRecord::Migration
  def change
    add_reference :assertions, :request, index: true
  end
end
