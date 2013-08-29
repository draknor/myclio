require "spec_helper"

describe DataController do
  describe "routing" do

    it "routes to #index" do
      get("/data").should route_to("data#index")
    end

    it "routes to #new" do
      get("/data/new").should route_to("data#new")
    end

    it "routes to #show" do
      get("/data/1").should route_to("data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/data/1/edit").should route_to("data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/data").should route_to("data#create")
    end

    it "routes to #update" do
      put("/data/1").should route_to("data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/data/1").should route_to("data#destroy", :id => "1")
    end

  end
end
