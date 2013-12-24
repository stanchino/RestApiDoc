require 'spec_helper'

describe "suites/index" do
  before(:each) do
    assign(:suites, [
      stub_model(Suite,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :project => nil
      ),
      stub_model(Suite,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :project => nil
      )
    ])
  end

  it "renders a list of suites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
