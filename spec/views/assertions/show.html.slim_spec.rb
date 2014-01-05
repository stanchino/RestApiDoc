require 'spec_helper'

describe "assertions/show" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = project.suites.create!(name: "MySuite")
    @page = @suite.pages.create!(name: "MyPage")
    @request = @page.requests.create!(title: "MyRequest")
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

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Expect status to equal 200 and assign it to MyString/)
  end
end
