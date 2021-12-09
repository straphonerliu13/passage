require "rails_helper"

RSpec.describe RecordingResource, type: :resource do
  describe "serialization" do
    let!(:recording) { create(:recording) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recording.id)
      expect(data.jsonapi_type).to eq("recordings")
    end
  end

  describe "filtering" do
    let!(:recording1) { create(:recording) }
    let!(:recording2) { create(:recording) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recording2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recording2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recording1) { create(:recording) }
      let!(:recording2) { create(:recording) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recording1.id,
                                      recording2.id,
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
                                      recording2.id,
                                      recording1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
