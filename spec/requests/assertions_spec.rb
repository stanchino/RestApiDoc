require 'spec_helper'

describe "Assertions" do
  describe "GET /assertions" do
    before do
      login_user
      @suite = @user.suites.create(FactoryGirl.attributes_for(:suite))
      @page = @suite.pages.create(FactoryGirl.attributes_for(:page))
      @request = @page.requests.create(FactoryGirl.attributes_for(:request))
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get suite_page_request_assertions_path(@suite, @page, @request)
      response.status.should be(200)
    end
  end
end
