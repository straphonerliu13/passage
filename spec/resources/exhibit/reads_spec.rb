require "rails_helper"

RSpec.describe ExhibitResource, type: :resource do
  describe "serialization" do
    let!(:exhibit) { create(:exhibit) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(exhibit.id)
      expect(data.jsonapi_type).to eq("exhibits")
    end
  end

  describe "filtering" do
    let!(:exhibit1) { create(:exhibit) }
    let!(:exhibit2) { create(:exhibit) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: exhibit2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([exhibit2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:exhibit1) { create(:exhibit) }
      let!(:exhibit2) { create(:exhibit) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      exhibit1.id,
                                      exhibit2.id,
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
                                      exhibit2.id,
                                      exhibit1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
