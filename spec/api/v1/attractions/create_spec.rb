require 'rails_helper'

RSpec.describe "attractions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/attractions", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'attractions',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AttractionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Attraction.count }.by(1)
    end
  end
end
