require 'spec_helper'

describe "Requests" do
  describe "GET /requests" do
    before do
      login_user
      @suite = @user.suites.create(FactoryGirl.attributes_for(:suite))
      @page = @suite.pages.create(FactoryGirl.attributes_for(:page))
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get suite_page_requests_path(@suite, @page)
      response.status.should be(200)
    end
  end
end
