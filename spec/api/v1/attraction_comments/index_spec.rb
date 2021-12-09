require "rails_helper"

RSpec.describe "attraction_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/attraction_comments", params: params
  end

  describe "basic fetch" do
    let!(:attraction_comment1) { create(:attraction_comment) }
    let!(:attraction_comment2) { create(:attraction_comment) }

    it "works" do
      expect(AttractionCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["attraction_comments"])
      expect(d.map(&:id)).to match_array([attraction_comment1.id,
                                          attraction_comment2.id])
    end
  end
end
