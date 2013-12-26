class UsersProject < UsersResource
  belongs_to :project, class_name: "Project", foreign_key: "resource_id"
end
