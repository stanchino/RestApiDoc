class Assertion < ActiveRecord::Base
  belongs_to :request
  accepts_nested_attributes_for :request
end
