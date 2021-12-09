require "rails_helper"

RSpec.describe ExhibitCommentResource, type: :resource do
  describe "serialization" do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(exhibit_comment.id)
      expect(data.jsonapi_type).to eq("exhibit_comments")
    end
  end

  describe "filtering" do
    let!(:exhibit_comment1) { create(:exhibit_comment) }
    let!(:exhibit_comment2) { create(:exhibit_comment) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: exhibit_comment2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([exhibit_comment2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:exhibit_comment1) { create(:exhibit_comment) }
      let!(:exhibit_comment2) { create(:exhibit_comment) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      exhibit_comment1.id,
                                      exhibit_comment2.id,
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
                                      exhibit_comment2.id,
                                      exhibit_comment1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
