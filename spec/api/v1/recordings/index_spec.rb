require "rails_helper"

RSpec.describe "recordings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recordings", params: params
  end

  describe "basic fetch" do
    let!(:recording1) { create(:recording) }
    let!(:recording2) { create(:recording) }

    it "works" do
      expect(RecordingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["recordings"])
      expect(d.map(&:id)).to match_array([recording1.id, recording2.id])
    end
  end
end
