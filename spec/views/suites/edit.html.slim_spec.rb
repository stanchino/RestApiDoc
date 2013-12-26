require 'spec_helper'

describe "suites/edit" do
  before(:each) do
    @suite = assign(:suite, stub_model(Suite,
      :name => "MyString",
      :title => "MyString",
      :description => "MyText",
      :published => false,
      :order => 1,
      :project => nil
    ))
  end

  it "renders the edit suite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suite_path(@suite), "post" do
      assert_select "input#suite_name[name=?]", "suite[name]"
      assert_select "input#suite_title[name=?]", "suite[title]"
      assert_select "textarea#suite_description[name=?]", "suite[description]"
      assert_select "input#suite_published[name=?]", "suite[published]"
    end
  end
end
