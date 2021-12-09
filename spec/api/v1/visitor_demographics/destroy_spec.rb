require "rails_helper"

RSpec.describe "visitor_demographics#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/visitor_demographics/#{visitor_demographic.id}"
  end

  describe "basic destroy" do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    it "updates the resource" do
      expect(VisitorDemographicResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { VisitorDemographic.count }.by(-1)
      expect { visitor_demographic.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
