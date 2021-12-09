require 'rails_helper'

RSpec.describe ExhibitResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'exhibits',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ExhibitResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Exhibit.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:exhibit) { create(:exhibit) }

    let(:payload) do
      {
        data: {
          id: exhibit.id.to_s,
          type: 'exhibits',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ExhibitResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { exhibit.reload.updated_at }
      # .and change { exhibit.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:exhibit) { create(:exhibit) }

    let(:instance) do
      ExhibitResource.find(id: exhibit.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Exhibit.count }.by(-1)
    end
  end
end
