require 'spec_helper'

describe "suites/show" do
  before(:each) do
    project = FactoryGirl.create :project
    @suite = assign(:suite, stub_model(Suite,
      :name => "Name",
      :title => "Title",
      :description => "MyText",
      :published => false,
      :order => 1,
      :project => project
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
