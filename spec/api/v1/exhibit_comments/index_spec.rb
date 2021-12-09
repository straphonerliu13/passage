require "rails_helper"

RSpec.describe "exhibit_comments#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/exhibit_comments", params: params
  end

  describe "basic fetch" do
    let!(:exhibit_comment1) { create(:exhibit_comment) }
    let!(:exhibit_comment2) { create(:exhibit_comment) }

    it "works" do
      expect(ExhibitCommentResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["exhibit_comments"])
      expect(d.map(&:id)).to match_array([exhibit_comment1.id,
                                          exhibit_comment2.id])
    end
  end
end
