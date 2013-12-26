require 'spec_helper'

describe "suites/new" do
  before(:each) do
    assign(:suite, stub_model(Suite,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false,
      :order => 1,
      :project => nil
    ).as_new_record)
  end

  it "renders new suite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suites_path, "post" do
      assert_select "input#suite_name[name=?]", "suite[name]"
      assert_select "input#suite_title[name=?]", "suite[title]"
      assert_select "textarea#suite_description[name=?]", "suite[description]"
      assert_select "input#suite_published[name=?]", "suite[published]"
    end
  end
end
