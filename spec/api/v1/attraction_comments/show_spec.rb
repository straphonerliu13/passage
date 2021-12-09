require "rails_helper"

RSpec.describe "attraction_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attraction_comments/#{attraction_comment.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:attraction_comment) { create(:attraction_comment) }

    it "works" do
      expect(AttractionCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("attraction_comments")
      expect(d.id).to eq(attraction_comment.id)
    end
  end
end
