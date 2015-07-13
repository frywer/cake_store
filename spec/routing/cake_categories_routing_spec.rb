require "rails_helper"

RSpec.describe CakeCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cake_categories").to route_to("cake_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/cake_categories/new").to route_to("cake_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/cake_categories/1").to route_to("cake_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cake_categories/1/edit").to route_to("cake_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cake_categories").to route_to("cake_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/cake_categories/1").to route_to("cake_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cake_categories/1").to route_to("cake_categories#destroy", :id => "1")
    end

  end
end
