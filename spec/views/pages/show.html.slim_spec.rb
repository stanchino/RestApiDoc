require 'spec_helper'

describe "pages/show" do
  before(:each) do
    project = FactoryGirl.create :project
    suite = project.suites.create(:name => "MySuite")
    @page = assign(:page, stub_model(Page,
      :name => "Name",
      :title => "Title",
      :description => "MyText",
      :published => false,
      :order => 1,
      :suite => suite
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
