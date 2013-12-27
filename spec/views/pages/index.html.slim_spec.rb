require 'spec_helper'

describe "pages/index" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create(:name => "MySuite")
    suite.pages = [
      stub_model(Page,
         :name => "Name",
         :title => "Title",
         :description => "MyText",
         :published => false,
         :order => 1,
      ),
      stub_model(Page,
         :name => "Name",
         :title => "Title",
         :description => "MyText",
         :published => false,
         :order => 1,
      ),
    ]
    assign(:suite, suite)
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h4", /Title/, :count => 2
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
