require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_title[name=?]", "project[title]"
      assert_select "textarea#project_description[name=?]", "project[description]"
      assert_select "input#project_published[name=?]", "project[published]"
    end
  end
end
