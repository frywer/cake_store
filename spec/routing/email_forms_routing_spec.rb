require "rails_helper"

RSpec.describe EmailFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_forms").to route_to("email_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/email_forms/new").to route_to("email_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/email_forms/1").to route_to("email_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_forms/1/edit").to route_to("email_forms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_forms").to route_to("email_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_forms/1").to route_to("email_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_forms/1").to route_to("email_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_forms/1").to route_to("email_forms#destroy", :id => "1")
    end

  end
end
