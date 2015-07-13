require 'rails_helper'

RSpec.describe "CakeCategories", type: :request do
  describe "GET /cake_categories" do
    it "works! (now write some real specs)" do
      get cake_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
