require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @request = assign(:request, @page.requests.create(FactoryGirl.attributes_for(:request)))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h3", /#{@request.title}/, :count => 1
    assert_select "p", @request.description, :count => 1
  end
end
