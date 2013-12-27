class Page < ActiveRecord::Base
  belongs_to :suite
  has_many :requests
end
