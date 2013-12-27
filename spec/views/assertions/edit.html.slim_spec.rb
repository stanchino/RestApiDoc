require 'spec_helper'

describe "assertions/edit" do
  before(:each) do
    @assertion = assign(:assertion, stub_model(Assertion,
      :title => "MyString",
      :description => "MyText",
      :assignment => "MyString",
      :expectation => "MyString",
      :code => "MyText"
    ))
  end

  it "renders the edit assertion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assertion_path(@assertion), "post" do
      assert_select "input#assertion_title[name=?]", "assertion[title]"
      assert_select "textarea#assertion_description[name=?]", "assertion[description]"
      assert_select "input#assertion_assignment[name=?]", "assertion[assignment]"
      assert_select "input#assertion_expectation[name=?]", "assertion[expectation]"
      assert_select "textarea#assertion_code[name=?]", "assertion[code]"
    end
  end
end
