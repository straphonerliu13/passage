require 'rails_helper'

RSpec.describe "exhibit_comments#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/exhibit_comments/#{exhibit_comment.id}"
  end

  describe 'basic destroy' do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    it 'updates the resource' do
      expect(ExhibitCommentResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ExhibitComment.count }.by(-1)
      expect { exhibit_comment.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
