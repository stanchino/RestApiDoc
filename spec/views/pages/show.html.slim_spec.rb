require 'spec_helper'

describe "pages/show" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, @suite.pages.create(FactoryGirl.attributes_for(:page)))
    assign(:pages, [@page])
    assign(:request, nil)
    @requests = []
    5.times do
      @requests << @page.requests.create(FactoryGirl.attributes_for(:request))
    end
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h1", /#{@page.title}/, :count => 1
    assert_select "h5", :text => @page.description, :count => 1
    @requests.each do |req|
      assert_select "h2", /#{req.title}/, :count => 1
      assert_select "h6", req.description, :count => 1
    end
  end
end
