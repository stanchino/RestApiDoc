class Request < ActiveRecord::Base
  belongs_to :entity
  belongs_to :page
  has_many :assertions
  accepts_nested_attributes_for :entity
end
