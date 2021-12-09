require 'rails_helper'

RSpec.describe "visitor_demographics#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/visitor_demographics", payload
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
          type: 'visitor_demographics',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(VisitorDemographicResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { VisitorDemographic.count }.by(1)
    end
  end
end
