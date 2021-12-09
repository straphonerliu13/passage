require "rails_helper"

RSpec.describe "visitor_demographics#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/visitor_demographics", params: params
  end

  describe "basic fetch" do
    let!(:visitor_demographic1) { create(:visitor_demographic) }
    let!(:visitor_demographic2) { create(:visitor_demographic) }

    it "works" do
      expect(VisitorDemographicResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["visitor_demographics"])
      expect(d.map(&:id)).to match_array([visitor_demographic1.id,
                                          visitor_demographic2.id])
    end
  end
end
