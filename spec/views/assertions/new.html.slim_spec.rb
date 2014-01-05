require 'spec_helper'

describe "assertions/new" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create!(name: "MySuite")
    @page = @suite.pages.create!(name: "MyPage")
    @request = @page.requests.create!(title: "MyRequest")
    assign(:project, project)
    assign(:suite, @suite)
    assign(:page, @page)
    assign(:request, @request)
    @assertion = assign(:assertion, stub_model(Assertion,
      :expectation => "status",
      :condition => "equal",
      :expected => "200",
      :assignment => "MyString",
      :request => @request
    ))
  end

  it "renders new assertion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_page_request_assertion_path(@suite, @page, @request, @assertion), "post" do
      assert_select "select#assertion_expectation[name=?]", "assertion[expectation]"
      assert_select "select#assertion_condition[name=?]", "assertion[condition]"
      assert_select "input#assertion_expected[name=?]", "assertion[expected]"
      assert_select "input#assertion_assignment[name=?]", "assertion[assignment]"
    end
  end
end
