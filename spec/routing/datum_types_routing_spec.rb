require "spec_helper"

describe DatumTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/datum_types").should route_to("datum_types#index")
    end

    it "routes to #new" do
      get("/datum_types/new").should route_to("datum_types#new")
    end

    it "routes to #show" do
      get("/datum_types/1").should route_to("datum_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/datum_types/1/edit").should route_to("datum_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/datum_types").should route_to("datum_types#create")
    end

    it "routes to #update" do
      put("/datum_types/1").should route_to("datum_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/datum_types/1").should route_to("datum_types#destroy", :id => "1")
    end

  end
end
