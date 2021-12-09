require "rails_helper"

RSpec.describe "recordings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recordings/#{recording.id}", payload
  end

  describe "basic update" do
    let!(:recording) { create(:recording) }

    let(:payload) do
      {
        data: {
          id: recording.id.to_s,
          type: "recordings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RecordingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { recording.reload.attributes }
    end
  end
end
