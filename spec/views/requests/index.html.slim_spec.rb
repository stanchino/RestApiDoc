require 'spec_helper'

describe "requests/index" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @requests = []
    @assertions = []
    5.times do
      req = @page.requests.create(FactoryGirl.attributes_for(:request))
      5.times do
        @assertions << req.assertions.create(FactoryGirl.attributes_for(:assertion))
      end
      @requests << req
    end
    assign(:requests, @requests)
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @requests.each do |req|
      assert_select "h2", /#{req.title}/, :count => 1
      assert_select "h6", req.description, :count => 1
    end
    @assertions.each do |assertion|
      assert_select "h6", "Expect #{assertion.expectation} to #{assertion.condition} #{assertion.expected} and assign it to #{assertion.assignment}"
    end
  end
end
