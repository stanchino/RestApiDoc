# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating super admin user"

User.where(
  first_name: "Super",
  last_name: "Admin",
  email: 'admin@zaxsis.com'
).first_or_initialize.tap do |superadmin|
  superadmin.password = superadmin.password_confirmation = 'alabala123'
  superadmin.role = "super_admin"
  superadmin.save!
  superadmin.confirm!
end
