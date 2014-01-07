require 'spec_helper'

describe "suites/new" do
  before(:each) do
    @project = assign(:project, FactoryGirl.create(:project))
    @suite = assign(:suite, @project.suites.build(FactoryGirl.attributes_for(:suite)))
  end

  it "renders new suite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_suites_path(@project), "post" do
      assert_select "input#suite_title[name=?]", "suite[title]"
      assert_select "textarea#suite_description[name=?]", "suite[description]"
      assert_select "input#suite_published[name=?]", "suite[published]"
    end
  end
end
