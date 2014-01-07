require 'spec_helper'

describe "requests/index" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @requests = []
    5.times do
      @requests << @page.requests.create(FactoryGirl.attributes_for(:request))
    end
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @requests.each do |req|
      assert_select "h3", /#{req.title}/, :count => 1
      assert_select "p", req.description, :count => 1
    end
  end
end
