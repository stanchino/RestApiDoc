require 'spec_helper'

describe "pages/index" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create(:name => "MySuite")
    assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :suite => suite
      ),
      stub_model(Page,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :suite => suite
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "ul>li>h4", /Title/, :count => 2
    assert_select "ul>li>p", :text => "MyText".to_s, :count => 2
  end
end
