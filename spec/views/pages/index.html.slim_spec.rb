require 'spec_helper'

describe "pages/index" do
  before do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @pages = []
    5.times do
      @pages << @suite.pages.create(FactoryGirl.attributes_for(:page))
    end
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    @pages.each do |page|
      assert_select "h3", /#{page.title}/, :count => 1
      assert_select "h3>a[href=?]", project_suite_page_url(@project, @suite, page), :count => 1
    end
    rendered.should match(/href="#{new_project_suite_page_url(@project, @suite)}"/)
  end
end
