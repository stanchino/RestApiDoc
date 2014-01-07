require 'spec_helper'

describe "projects/index" do
  before do
    @projects = []
    5.times do
      @projects << FactoryGirl.create(:project)
    end
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @projects.each do |project|
      assert_select "h3", /#{project.title}/, :count => 1
      assert_select "h3>a[href=?]", project_url(project), :count => 1
    end
    rendered.should match(/href="#{new_project_url}"/)
  end
end
