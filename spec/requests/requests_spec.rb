require 'spec_helper'

describe "Requests" do
  describe "GET /requests" do
    before do
      login_user
      @suite = @user.suites.create(name: "MySuite")
      @page = @suite.pages.create(name: "MyPage")
    end

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get suite_page_requests_path(@suite, @page)
      response.status.should be(200)
    end
  end
end
