require "rails_helper"

RSpec.describe "exhibits#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/exhibits/#{exhibit.id}", payload
  end

  describe "basic update" do
    let!(:exhibit) { create(:exhibit) }

    let(:payload) do
      {
        data: {
          id: exhibit.id.to_s,
          type: "exhibits",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ExhibitResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { exhibit.reload.attributes }
    end
  end
end
