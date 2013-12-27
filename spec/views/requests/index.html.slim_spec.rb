require 'spec_helper'

describe "requests/index" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create!(name: "MySuite")
    page = suite.pages.create!(name: "MyPage")
    assign(:suite, suite)
    assign(:page, page)
    assign(:requests, [
      stub_model(Request,
        :title => "Title",
        :description => "MyText",
        :method => "Method",
        :entity => nil
      ),
      stub_model(Request,
        :title => "Title",
        :description => "MyText",
        :method => "Method",
        :entity => nil
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Method".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
