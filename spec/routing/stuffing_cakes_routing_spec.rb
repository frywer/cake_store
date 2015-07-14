require "rails_helper"

RSpec.describe StuffingCakesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stuffing_cakes").to route_to("stuffing_cakes#index")
    end

    it "routes to #new" do
      expect(:get => "/stuffing_cakes/new").to route_to("stuffing_cakes#new")
    end

    it "routes to #show" do
      expect(:get => "/stuffing_cakes/1").to route_to("stuffing_cakes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stuffing_cakes/1/edit").to route_to("stuffing_cakes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stuffing_cakes").to route_to("stuffing_cakes#create")
    end

    it "routes to #update" do
      expect(:put => "/stuffing_cakes/1").to route_to("stuffing_cakes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stuffing_cakes/1").to route_to("stuffing_cakes#destroy", :id => "1")
    end

  end
end
