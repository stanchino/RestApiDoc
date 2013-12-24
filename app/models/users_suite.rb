class UsersSuite < UsersResource
  belongs_to :suite, class_name: "Suite", foreign_key: "resource_id"
end
