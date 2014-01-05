require 'spec_helper'

describe "assertions/edit" do
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
      :title => "MyString",
      :description => "MyText",
      :assignment => "MyString",
      :expectation => "MyString",
      :code => "MyText"
    ))
  end

  it "renders the edit assertion form" do
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
