class Suite < ActiveRecord::Base
  belongs_to :project
  has_many :pages
  has_many :users_suites, foreign_key: "resource_id"
  has_many :users, through: :users_suites
  default_scope { order('"order" ASC') }
  accepts_nested_attributes_for :users_suites, :project
end
