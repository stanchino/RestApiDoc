require 'spec_helper'

describe "assertions/index" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create!(name: "MySuite")
    page = suite.pages.create!(name: "MyPage")
    request = page.requests.create!(title: "MyRequest")
    request.assertions =  [
      stub_model(Assertion,
        :expectation => "status",
        :condition => "equal",
        :expected => "200",
        :request => request
      ),
      stub_model(Assertion,
        :expectation => "status",
        :condition => "equal",
        :expected => "200",
        :request => request
      )
    ]
    assign(:project, project)
    assign(:suite, suite)
    assign(:page, page)
    assign(:request, request)
  end

  it "renders a list of assertions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "p", :text => "Expect status to equal 200".to_s, :count => 2
  end
end
