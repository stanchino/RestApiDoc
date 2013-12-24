require 'spec_helper'

describe "suites/show" do
  before(:each) do
    @suite = assign(:suite, stub_model(Suite,
      :name => "Name",
      :title => "Title",
      :description => "MyText",
      :published => false,
      :order => 1,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
