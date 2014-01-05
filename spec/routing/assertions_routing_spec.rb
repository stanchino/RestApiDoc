require "spec_helper"

describe AssertionsController do
  describe "routing" do

    it "routes to #index" do
      get("/suites/1/pages/2/requests/3/assertions").should route_to("assertions#index", :suite_id => "1", :page_id => "2", :request_id => "3")
    end

    it "routes to #new" do
      get("/suites/1/pages/2/requests/3/assertions/new").should route_to("assertions#new", :suite_id => "1", :page_id => "2", :request_id => "3")
    end

    it "routes to #show" do
      get("/suites/1/pages/2/requests/3/assertions/4").should route_to("assertions#show", :suite_id => "1", :page_id => "2", :request_id => "3", :id => "4")
    end

    it "routes to #edit" do
      get("/suites/1/pages/2/requests/3/assertions/4/edit").should route_to("assertions#edit", :suite_id => "1", :page_id => "2", :request_id => "3", :id => "4")
    end

    it "routes to #create" do
      post("/suites/1/pages/2/requests/3/assertions").should route_to("assertions#create", :suite_id => "1", :page_id => "2", :request_id => "3")
    end

    it "routes to #update" do
      put("/suites/1/pages/2/requests/3/assertions/4").should route_to("assertions#update", :suite_id => "1", :page_id => "2", :request_id => "3", :id => "4")
    end

    it "routes to #destroy" do
      delete("/suites/1/pages/2/requests/3/assertions/4").should route_to("assertions#destroy", :suite_id => "1", :page_id => "2", :request_id => "3", :id => "4")
    end

  end
end
