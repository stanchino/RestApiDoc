require "spec_helper"

describe AssertionsController do
  describe "routing" do

    it "routes to #index" do
      get("/assertions").should route_to("assertions#index")
    end

    it "routes to #new" do
      get("/assertions/new").should route_to("assertions#new")
    end

    it "routes to #show" do
      get("/assertions/1").should route_to("assertions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assertions/1/edit").should route_to("assertions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assertions").should route_to("assertions#create")
    end

    it "routes to #update" do
      put("/assertions/1").should route_to("assertions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assertions/1").should route_to("assertions#destroy", :id => "1")
    end

  end
end
