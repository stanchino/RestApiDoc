class UsersProject < UsersResource
  belongs_to :project, foreign_key: "resource_id"
end
