require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @request = assign(:request, @page.requests.create(FactoryGirl.attributes_for(:request)))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_suite_page_request_path(@project, @suite, @page, @request), "post" do
      assert_select "select#request_action[name=?]", "request[action]"
      assert_select "select#request_action>option[value=?][selected='selected']", @request.action
      assert_select "input#request_uri[name=?]", "request[uri]"
      assert_select "input#request_uri[value=?]", @request.uri
      assert_select "textarea#request_body[name=?]", "request[body]"
      assert_select "textarea#request_body", @request.body
      assert_select "input#request_title[name=?]", "request[title]"
      assert_select "input#request_title[value=?]", @request.title
      assert_select "textarea#request_description[name=?]", "request[description]"
      assert_select "textarea#request_description", @request.description
    end
    assert_select ".breadcrumbs", :match => /href="#{root_url}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_url(@project)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_url(@project, @suite)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_page_url(@project, @suite, @page)}"/, :count => 1
  end
end
