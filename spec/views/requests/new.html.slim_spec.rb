require 'spec_helper'

describe "requests/new" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create!(name: "MySuite")
    @page = @suite.pages.create!(name: "MyPage")
    assign(:suite, @suite)
    assign(:page, @page)
    assign(:request, stub_model(Request,
      :title => "MyString",
      :description => "MyText",
      :method => "MyString",
      :entity => nil
    ).as_new_record)
  end

  it "renders new request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_page_requests_path(@suite, @page), "post" do
      #assert_select "input#request_title[name=?]", "request[title]"
      #assert_select "textarea#request_description[name=?]", "request[description]"
      #assert_select "input#request_method[name=?]", "request[method]"
      #assert_select "input#request_entity[name=?]", "request[entity]"
    end
  end
end
