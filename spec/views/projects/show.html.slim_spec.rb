require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "Name",
      :title => "Title",
      :description => "MyText",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
