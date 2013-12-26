require 'spec_helper'

describe "pages/new" do
  before do
    project = FactoryGirl.create :project
    @suite = project.suites.create(:name => "MySuite")
    assign(:page, stub_model(Page,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false,
      :order => 1,
      :suite => @suite
    ).as_new_record)
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_pages_path(@suite), "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_title[name=?]", "page[title]"
      assert_select "textarea#page_description[name=?]", "page[description]"
      assert_select "input#page_published[name=?]", "page[published]"
    end
  end
end
