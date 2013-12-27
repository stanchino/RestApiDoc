require "spec_helper"

describe RequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/suites/1/pages/2/requests").should route_to("requests#index", :suite_id => "1", :page_id => "2")
    end

    it "routes to #new" do
      get("/suites/1/pages/2/requests/new").should route_to("requests#new", :suite_id => "1", :page_id => "2")
    end

    it "routes to #show" do
      get("/suites/1/pages/2/requests/1").should route_to("requests#show", :suite_id => "1", :page_id => "2", :id => "1")
    end

    it "routes to #edit" do
      get("/suites/1/pages/2/requests/1/edit").should route_to("requests#edit", :suite_id => "1", :page_id => "2", :id => "1")
    end

    it "routes to #create" do
      post("/suites/1/pages/2/requests").should route_to("requests#create", :suite_id => "1", :page_id => "2")
    end

    it "routes to #update" do
      put("/suites/1/pages/2/requests/1").should route_to("requests#update", :suite_id => "1", :page_id => "2", :id => "1")
    end

    it "routes to #destroy" do
      delete("/suites/1/pages/2/requests/1").should route_to("requests#destroy", :suite_id => "1", :page_id => "2", :id => "1")
    end

  end
end
