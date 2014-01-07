require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    before do
      login_user
      @project = @user.projects.create(FactoryGirl.attributes_for(:project))
      @suite = @user.suites.create(FactoryGirl.attributes_for(:suite).merge({:project => @project}))
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get suite_pages_path(@suite)
      response.status.should be(200)
    end
  end
end
