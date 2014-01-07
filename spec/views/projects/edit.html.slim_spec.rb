require 'spec_helper'

describe "projects/edit" do
  before do
    @project = assign(:project, stub_model(Project, FactoryGirl.attributes_for(:project)))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_path(@project), "post" do
      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "input#project_title[value=?]", @project.title
      assert_select "textarea#project_description[name=?]", "project[description]"
      assert_select "textarea#project_description", @project.description
      assert_select "input#project_published[name=?]", "project[published]"
    end
    assert_select ".breadcrumbs", :match => /href="#{root_url}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_url(@project)}"/, :count => 1
  end
end
