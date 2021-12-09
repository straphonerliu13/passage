require 'rails_helper'

RSpec.describe "visitor_demographics#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/visitor_demographics/#{visitor_demographic.id}", params: params
  end

  describe 'basic fetch' do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    it 'works' do
      expect(VisitorDemographicResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('visitor_demographics')
      expect(d.id).to eq(visitor_demographic.id)
    end
  end
end
