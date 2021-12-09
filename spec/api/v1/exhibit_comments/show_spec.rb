require "rails_helper"

RSpec.describe "exhibit_comments#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exhibit_comments/#{exhibit_comment.id}", params: params
  end

  describe "basic fetch" do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    it "works" do
      expect(ExhibitCommentResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("exhibit_comments")
      expect(d.id).to eq(exhibit_comment.id)
    end
  end
end
