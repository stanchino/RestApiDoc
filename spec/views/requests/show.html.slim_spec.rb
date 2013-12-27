require 'spec_helper'

describe "requests/show" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create!(name: "MySuite")
    page = suite.pages.create!(name: "MyPage")
    assign(:suite, suite)
    assign(:page, page)
    @request = assign(:request, stub_model(Request,
      :title => "Title",
      :description => "MyText",
      :method => "Method",
      :entity => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Method/)
    rendered.should match(//)
  end
end
