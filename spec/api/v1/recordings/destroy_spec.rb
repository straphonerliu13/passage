require 'rails_helper'

RSpec.describe "recordings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recordings/#{recording.id}"
  end

  describe 'basic destroy' do
    let!(:recording) { create(:recording) }

    it 'updates the resource' do
      expect(RecordingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Recording.count }.by(-1)
      expect { recording.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
