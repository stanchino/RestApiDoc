require 'spec_helper'

describe "assertions/index" do
  before(:each) do
    assign(:assertions, [
      stub_model(Assertion,
        :title => "Title",
        :description => "MyText",
        :assignment => "Assignment",
        :expectation => "Expectation",
        :code => "MyTextCode"
      ),
      stub_model(Assertion,
        :title => "Title",
        :description => "MyText",
        :assignment => "Assignment",
        :expectation => "Expectation",
        :code => "MyTextCode"
      )
    ])
  end

  it "renders a list of assertions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Assignment".to_s, :count => 2
    assert_select "tr>td", :text => "Expectation".to_s, :count => 2
    assert_select "tr>td", :text => "MyTextCode".to_s, :count => 2
  end
end
