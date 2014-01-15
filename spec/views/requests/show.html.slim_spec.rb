require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    @request = assign(:request, @page.requests.create(FactoryGirl.attributes_for(:request)))
    assign(:requests, [@request])
    @assertions = []
    5.times do
      @assertions << @request.assertions.create(FactoryGirl.attributes_for(:assertion))
    end
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2", /#{@request.title}/, :count => 1
    assert_select "h6", :text => @request.description, :count => 1
    @assertions.each do |assertion|
      assert_select "h6", "Expect #{assertion.expectation} to #{assertion.condition} #{assertion.expected} and assign it to #{assertion.assignment}"
    end
  end
end
