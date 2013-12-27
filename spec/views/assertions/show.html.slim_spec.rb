require 'spec_helper'

describe "assertions/show" do
  before(:each) do
    @assertion = assign(:assertion, stub_model(Assertion,
      :title => "Title",
      :description => "MyText",
      :assignment => "Assignment",
      :expectation => "Expectation",
      :code => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Assignment/)
    rendered.should match(/Expectation/)
    rendered.should match(/MyText/)
  end
end
