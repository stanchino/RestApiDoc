require 'spec_helper'

describe "projects/show" do
  before do
    @project = assign(:project, stub_model(Project, FactoryGirl.attributes_for(:project)))
    assign(:projects, [@project])
    @suites = []
    5.times do
      @suites << @project.suites.create(FactoryGirl.attributes_for(:suite))
    end
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h1", /#{@project.title}/, :count => 1
    assert_select "h5", :text => @project.description, :count => 1
    @suites.each do |suite|
      assert_select "h2", suite.title, :count => 1
      assert_select "h2>a[href=?]", project_suite_url(@project, suite), :count => 1
      assert_select "h6", suite.description, :count => 1
    end
    rendered.should match(/href="#{new_project_url}"/)
  end
end
