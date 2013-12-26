require 'spec_helper'

describe "Suites" do
  describe "GET /suites" do
    before do
      login_user
      @project = @user.projects.create!(name: "MyProject")
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get project_suites_path(@project)
      response.status.should be(200)
    end
  end
end
