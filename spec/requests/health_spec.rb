require 'rails_helper'

RSpec.describe "Healths", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/health/index"
      json =  JSON.parse(response.body).deep_symbolize_keys
      expect(json[:status]).to eq('Online')
      expect(response.status).to eq(200)
    end
  end

end
