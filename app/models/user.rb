class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects, through: :users_project, class_name: "Project", foreign_key: :resource_id
  has_many :suites, through: :users_suites, class_name: "Suite", foreign_key: :resource_id

  ROLES = %w[:super_admin, :admin, :user]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role.to_s)
  end
end
