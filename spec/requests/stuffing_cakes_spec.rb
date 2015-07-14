require 'rails_helper'

RSpec.describe "StuffingCakes", type: :request do
  describe "GET /stuffing_cakes" do
    it "works! (now write some real specs)" do
      get stuffing_cakes_path
      expect(response).to have_http_status(200)
    end
  end
end
