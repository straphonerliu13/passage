require 'rails_helper'

RSpec.describe "attraction_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/attraction_comments/#{attraction_comment.id}"
  end

  describe 'basic destroy' do
    let!(:attraction_comment) { create(:attraction_comment) }

    it 'updates the resource' do
      expect(AttractionCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AttractionComment.count }.by(-1)
      expect { attraction_comment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
