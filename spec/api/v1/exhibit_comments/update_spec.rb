require "rails_helper"

RSpec.describe "exhibit_comments#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/exhibit_comments/#{exhibit_comment.id}", payload
  end

  describe "basic update" do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    let(:payload) do
      {
        data: {
          id: exhibit_comment.id.to_s,
          type: "exhibit_comments",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ExhibitCommentResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { exhibit_comment.reload.attributes }
    end
  end
end
