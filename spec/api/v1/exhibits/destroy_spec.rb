require 'rails_helper'

RSpec.describe "exhibits#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/exhibits/#{exhibit.id}"
  end

  describe 'basic destroy' do
    let!(:exhibit) { create(:exhibit) }

    it 'updates the resource' do
      expect(ExhibitResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Exhibit.count }.by(-1)
      expect { exhibit.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
