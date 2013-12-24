require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false,
      :order => 1,
      :suite => nil
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_name[name=?]", "page[name]"
      assert_select "input#page_title[name=?]", "page[title]"
      assert_select "textarea#page_description[name=?]", "page[description]"
      assert_select "input#page_published[name=?]", "page[published]"
      assert_select "input#page_order[name=?]", "page[order]"
    end
  end
end
