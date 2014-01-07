require 'spec_helper'

describe "assertions/edit" do
  before do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @request = assign(:request, @page.requests.create(FactoryGirl.attributes_for(:request)))
    @assertion = assign(:assertion, @request.assertions.create(FactoryGirl.attributes_for(:assertion)))
  end

  it "renders new assertion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_suite_page_request_assertion_path(@project, @suite, @page, @request, @assertion), "post" do
      assert_select "select#assertion_expectation[name=?]", "assertion[expectation]"
      assert_select "select#assertion_expectation>option[value=?][selected='selected']", @assertion.expectation
      assert_select "select#assertion_condition[name=?]", "assertion[condition]"
      assert_select "select#assertion_condition>option[value=?][selected='selected']", @assertion.condition
      assert_select "input#assertion_expected[name=?]", "assertion[expected]"
      assert_select "input#assertion_expected[value=?]", @assertion.expected
      assert_select "input#assertion_assignment[name=?]", "assertion[assignment]"
      assert_select "input#assertion_assignment[value=?]", @assertion.assignment
    end
    assert_select ".breadcrumbs", :match => /href="#{root_url}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_url(@project)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_url(@project, @suite)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_page_url(@project, @suite, @page)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_page_request_url(@project, @suite, @page, @request)}"/, :count => 1
  end
end
