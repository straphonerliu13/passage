require "rails_helper"

RSpec.describe "visitor_demographics#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/visitor_demographics/#{visitor_demographic.id}",
                payload
  end

  describe "basic update" do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    let(:payload) do
      {
        data: {
          id: visitor_demographic.id.to_s,
          type: "visitor_demographics",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VisitorDemographicResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { visitor_demographic.reload.attributes }
    end
  end
end
