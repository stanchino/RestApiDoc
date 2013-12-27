class Request < ActiveRecord::Base
  belongs_to :entity
  belongs_to :page
  accepts_nested_attributes_for :entity
end
