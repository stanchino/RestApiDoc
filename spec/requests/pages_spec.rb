require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    before do
      login_user
      @suite = create_suite
      @pages = create_pages
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_suite_pages_path(@project, @suite)
      response.status.should be(200)
    end
  end
end
