require "rails_helper"

RSpec.describe PaintingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/paintings").to route_to("paintings#index")
    end

    it "routes to #new" do
      expect(:get => "/paintings/new").to route_to("paintings#new")
    end

    it "routes to #show" do
      expect(:get => "/paintings/1").to route_to("paintings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/paintings/1/edit").to route_to("paintings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/paintings").to route_to("paintings#create")
    end

    it "routes to #update" do
      expect(:put => "/paintings/1").to route_to("paintings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/paintings/1").to route_to("paintings#destroy", :id => "1")
    end

  end
end
