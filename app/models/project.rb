class Project < ActiveRecord::Base
  has_many :suites
  has_many :users_projects, foreign_key: "resource_id"
  has_many :users, through: :users_projects
  scope :recent, -> { order("updated_at ASC") }
  default_scope { order("title ASC") }
  accepts_nested_attributes_for :users_projects
end
