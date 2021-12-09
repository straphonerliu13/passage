require 'rails_helper'

RSpec.describe "recordings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recordings/#{recording.id}", params: params
  end

  describe 'basic fetch' do
    let!(:recording) { create(:recording) }

    it 'works' do
      expect(RecordingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('recordings')
      expect(d.id).to eq(recording.id)
    end
  end
end
