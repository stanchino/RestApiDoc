# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating super admin user"

user = User.where(
  first_name: "Super",
  last_name: "Admin",
  email: 'admin@rest-api-doc.com'
).first_or_initialize.tap do |superadmin|
  superadmin.password = superadmin.password_confirmation = 'asdfasdf'
  superadmin.role = "super_admin"
  superadmin.confirmed_at = Date.today
  superadmin.save!
end

puts "Creating project"
project = user.projects.create(:title => "RestApiDoc API", :description => "Test suites for the RestApiDoc API")

puts "Creating suite"
suite = user.suites.create(:title => "Development Tests", :description => "Test the RestApiDoc API against 'development'", :project => project)

puts "Creating page"
manage_projects_page = suite.pages.create(:title => "Manage Projects", :description => "Testing projects management")

puts "Creating entity"
entity_one = Entity.new(:description => "Projects URI", :uri => "/projects")
entity_one.save!

puts "Creating POST /projects request"
create_project_one = manage_projects_page.requests.create(:title => "Create Project", :description => "Creates a new project", :method => "POST", :entity => entity_one)
create_project_one.assertions.create(:expectation => "status", :condition => "equal", :expected => "201 Created")
create_project_one.assertions.create(:expectation => "response", :condition => "match", :expected => '/\"id\": \"\(\d\)"\/', :assignment => "project_id")

puts "Creating GET /projects request"
get_projects_one = manage_projects_page.requests.create(:title => "List Projects", :description => "List all projects", :method => "GET", :entity => entity_one)
get_projects_one.assertions.create(:expectation => "status", :condition => "equal", :expected => "200 Ok")
