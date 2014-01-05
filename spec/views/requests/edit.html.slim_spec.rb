require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create!(name: "MySuite")
    @page = @suite.pages.create!(name: "MyPage")
    assign(:project, project)
    assign(:suite, @suite)
    assign(:page, @page)
    @request = assign(:request, stub_model(Request,
      :title => "MyString",
      :description => "MyText",
      :method => "MyString",
      :entity => nil,
      :page => @page
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_page_request_path(@suite, @page, @request), "post" do
      assert_select "select#request_method[name=?]", "request[method]"
      assert_select "input#request_entity_attributes_uri[name=?]", "request[entity_attributes][uri]"
      assert_select "textarea#request_body[name=?]", "request[body]"
      assert_select "input#request_title[name=?]", "request[title]"
      assert_select "textarea#request_description[name=?]", "request[description]"
    end
  end
end
