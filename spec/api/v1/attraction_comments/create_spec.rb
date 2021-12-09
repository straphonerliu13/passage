require 'rails_helper'

RSpec.describe "attraction_comments#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/attraction_comments", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'attraction_comments',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AttractionCommentResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AttractionComment.count }.by(1)
    end
  end
end
