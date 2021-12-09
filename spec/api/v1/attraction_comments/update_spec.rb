require "rails_helper"

RSpec.describe "attraction_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/attraction_comments/#{attraction_comment.id}", payload
  end

  describe "basic update" do
    let!(:attraction_comment) { create(:attraction_comment) }

    let(:payload) do
      {
        data: {
          id: attraction_comment.id.to_s,
          type: "attraction_comments",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(AttractionCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { attraction_comment.reload.attributes }
    end
  end
end
