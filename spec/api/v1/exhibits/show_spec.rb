require "rails_helper"

RSpec.describe "exhibits#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exhibits/#{exhibit.id}", params: params
  end

  describe "basic fetch" do
    let!(:exhibit) { create(:exhibit) }

    it "works" do
      expect(ExhibitResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("exhibits")
      expect(d.id).to eq(exhibit.id)
    end
  end
end
