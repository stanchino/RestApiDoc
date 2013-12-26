require 'spec_helper'

describe "suites/index" do
  before(:each) do
    project = FactoryGirl.create :project
    assign(:suites, [
      stub_model(Suite,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :project => project
      ),
      stub_model(Suite,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :project => project
      )
    ])
  end

  it "renders a list of suites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul>li>h3", /Title/, :count => 2
    assert_select "ul>li>p", :text => "MyText".to_s, :count => 2
  end
end
