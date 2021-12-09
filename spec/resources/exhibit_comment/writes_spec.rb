require "rails_helper"

RSpec.describe ExhibitCommentResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "exhibit_comments",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ExhibitCommentResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ExhibitComment.count }.by(1)
    end
  end

  describe "updating" do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    let(:payload) do
      {
        data: {
          id: exhibit_comment.id.to_s,
          type: "exhibit_comments",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ExhibitCommentResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { exhibit_comment.reload.updated_at }
      # .and change { exhibit_comment.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:exhibit_comment) { create(:exhibit_comment) }

    let(:instance) do
      ExhibitCommentResource.find(id: exhibit_comment.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ExhibitComment.count }.by(-1)
    end
  end
end
