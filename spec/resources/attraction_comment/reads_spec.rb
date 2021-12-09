require "rails_helper"

RSpec.describe AttractionCommentResource, type: :resource do
  describe "serialization" do
    let!(:attraction_comment) { create(:attraction_comment) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(attraction_comment.id)
      expect(data.jsonapi_type).to eq("attraction_comments")
    end
  end

  describe "filtering" do
    let!(:attraction_comment1) { create(:attraction_comment) }
    let!(:attraction_comment2) { create(:attraction_comment) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: attraction_comment2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([attraction_comment2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:attraction_comment1) { create(:attraction_comment) }
      let!(:attraction_comment2) { create(:attraction_comment) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      attraction_comment1.id,
                                      attraction_comment2.id,
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
                                      attraction_comment2.id,
                                      attraction_comment1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
