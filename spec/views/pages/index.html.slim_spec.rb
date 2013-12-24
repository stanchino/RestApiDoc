require 'spec_helper'

describe "pages/index" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :suite => nil
      ),
      stub_model(Page,
        :name => "Name",
        :title => "Title",
        :description => "MyText",
        :published => false,
        :order => 1,
        :suite => nil
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
