require "spec_helper"

describe PagesController do
  describe "routing" do

    it "routes to #index" do
      get("/suites/1/pages").should route_to("pages#index", :suite_id => "1")
    end

    it "routes to #new" do
      get("/suites/1/pages/new").should route_to("pages#new", :suite_id => "1")
    end

    it "routes to #show" do
      get("/suites/1/pages/1").should route_to("pages#show", :suite_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/suites/1/pages/1/edit").should route_to("pages#edit", :suite_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/suites/1/pages").should route_to("pages#create", :suite_id => "1")
    end

    it "routes to #update" do
      put("/suites/1/pages/1").should route_to("pages#update", :suite_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/suites/1/pages/1").should route_to("pages#destroy", :suite_id => "1", :id => "1")
    end

  end
end
