require 'spec_helper'

describe "pages/edit" do
  before do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.create(FactoryGirl.attributes_for(:suite)))
    @page = assign(:page, stub_model(Page, FactoryGirl.attributes_for(:page)))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_suite_page_path(@project, @suite, @page), "post" do
      assert_select "input#page_title[name=?]", "page[title]"
      assert_select "input#page_title[value=?]", @page.title
      assert_select "textarea#page_description[name=?]", "page[description]"
      assert_select "textarea#page_description", @page.description
      assert_select "input#page_published[name=?]", "page[published]"
    end
    assert_select ".breadcrumbs", :match => /href="#{root_url}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_url(@project)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_url(@project, @suite)}"/, :count => 1
    assert_select ".breadcrumbs", :match => /href="#{project_suite_page_url(@project, @suite, @page)}"/, :count => 1
  end
end
