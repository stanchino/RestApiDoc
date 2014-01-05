require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create(:name => "MySuite")
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false,
      :order => 1,
      :suite => @suite
    ))
    assign(:project, project)
    assign(:suite, @suite)
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_page_path(@suite, @page), "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_title[name=?]", "page[title]"
      assert_select "textarea#page_description[name=?]", "page[description]"
      assert_select "input#page_published[name=?]", "page[published]"
    end
  end
end
