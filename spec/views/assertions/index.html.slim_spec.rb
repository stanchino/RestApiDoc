require 'spec_helper'

describe "assertions/index" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @request = assign(:request, @page.requests.create(FactoryGirl.attributes_for(:request)))
    @assertions = []
    5.times do
      @assertions << @request.assertions.create(FactoryGirl.attributes_for(:assertion))
    end
  end

  it "renders a list of assertions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @assertions.each do |assertion|
      assert_select "h6", :match => /#{assertion.expectation}/
      assert_select "h6", :match => /#{assertion.condition}/
      assert_select "h6", :match => /#{assertion.expected}/
      assert_select "h6", :match => /#{assertion.assignment}/
    end
  end
end
