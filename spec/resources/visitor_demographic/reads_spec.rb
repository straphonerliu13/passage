require "rails_helper"

RSpec.describe VisitorDemographicResource, type: :resource do
  describe "serialization" do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(visitor_demographic.id)
      expect(data.jsonapi_type).to eq("visitor_demographics")
    end
  end

  describe "filtering" do
    let!(:visitor_demographic1) { create(:visitor_demographic) }
    let!(:visitor_demographic2) { create(:visitor_demographic) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: visitor_demographic2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([visitor_demographic2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:visitor_demographic1) { create(:visitor_demographic) }
      let!(:visitor_demographic2) { create(:visitor_demographic) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      visitor_demographic1.id,
                                      visitor_demographic2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      visitor_demographic2.id,
                                      visitor_demographic1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
