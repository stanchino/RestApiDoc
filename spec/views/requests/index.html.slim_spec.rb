require 'spec_helper'

describe "requests/index" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create!(name: "MySuite")
    page = suite.pages.create!(name: "MyPage")
    page.requests = [ 
      stub_model(Request,
        :title => "Title",
        :description => "MyText",
        :method => "Method",
        :entity => stub_model(Entity, :uri => "URI"),
        :page => page
      ),
      stub_model(Request,
        :title => "Title",
        :description => "MyText",
        :method => "Method",
        :entity => stub_model(Entity, :uri => "URI"),
        :page => page
      )
    ]
    assign(:suite, suite)
    assign(:page, page)
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h5", /Method URI/, :count => 2
    assert_select "p.small", /Title/, :count => 2
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
