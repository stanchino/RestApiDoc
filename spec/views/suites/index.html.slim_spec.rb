require 'spec_helper'

describe "suites/index" do
  before do
    @project = assign(:project, FactoryGirl.create(:project))
    @projects = assign(:projects, [@project])
    @suites = []
    5.times do
      @suites << @project.suites.create(FactoryGirl.attributes_for(:suite))
    end
  end

  it "renders a list of suites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @suites.each do |suite|
      assert_select "h3", /#{suite.title}/, :count => 1
      assert_select "h3>a[href=?]", project_suite_url(@project, suite), :count => 1
    end
  end
end
