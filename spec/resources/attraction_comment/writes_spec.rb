require 'rails_helper'

RSpec.describe AttractionCommentResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'attraction_comments',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AttractionCommentResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AttractionComment.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:attraction_comment) { create(:attraction_comment) }

    let(:payload) do
      {
        data: {
          id: attraction_comment.id.to_s,
          type: 'attraction_comments',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AttractionCommentResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { attraction_comment.reload.updated_at }
      # .and change { attraction_comment.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:attraction_comment) { create(:attraction_comment) }

    let(:instance) do
      AttractionCommentResource.find(id: attraction_comment.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AttractionComment.count }.by(-1)
    end
  end
end
