class Request < ActiveRecord::Base
  belongs_to :entity
  belongs_to :page
end
