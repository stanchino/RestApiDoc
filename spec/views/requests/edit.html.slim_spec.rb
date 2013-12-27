require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create!(name: "MySuite")
    @page = @suite.pages.create!(name: "MyPage")
    assign(:suite, @suite)
    assign(:page, @page)
    @request = assign(:request, stub_model(Request,
      :title => "MyString",
      :description => "MyText",
      :method => "MyString",
      :entity => nil
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_page_request_path(@suite, @page, @request), "post" do
      #assert_select "input#suite_page_request_title[name=?]", "request[title]"
      #assert_select "textarea#suite_page_request_description[name=?]", "request[description]"
      #assert_select "input#suite_page_request_method[name=?]", "request[method]"
      #assert_select "input#suite_page_request_entity[name=?]", "request[entity]"
    end
  end
end
