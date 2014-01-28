require 'spec_helper'

describe "suites/edit" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
  end

  it "renders the edit suite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_suite_path(@project, @suite), "post" do
      assert_select "input#suite_title[name=?]", "suite[title]"
      assert_select "input#suite_title[value=?]", @suite.title
      assert_select "textarea#suite_description[name=?]", "suite[description]"
      assert_select "textarea#suite_description", @suite.description
      assert_select "input#suite_published[name=?]", "suite[published]"
    end
    assert_select ".breadcrumbs", :match => /href="#{root_url}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_url(@project)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_url(@project, @suite)}"/, :count => 1
  end
end
