require 'spec_helper'

describe "suites/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project, FactoryGirl.attributes_for(:project)))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @pages = []
    5.times do
      @pages << @suite.pages.create(FactoryGirl.attributes_for(:page))
    end
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2", /#{@suite.title}/, :count => 1
    assert_select "p", :text => @suite.description, :count => 1
    @pages.each do |page|
      assert_select "h3", page.title, :count => 1
      assert_select "h3>a[href=?]", project_suite_page_url(@project, @suite, page), :count => 1
    end
    rendered.should match(/href="#{new_project_suite_page_url(@project, @suite)}"/)
  end
end
