require 'rails_helper'

RSpec.describe "exhibits#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exhibits", params: params
  end

  describe 'basic fetch' do
    let!(:exhibit1) { create(:exhibit) }
    let!(:exhibit2) { create(:exhibit) }

    it 'works' do
      expect(ExhibitResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['exhibits'])
      expect(d.map(&:id)).to match_array([exhibit1.id, exhibit2.id])
    end
  end
end
