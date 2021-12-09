require "rails_helper"

RSpec.describe VisitorDemographicResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "visitor_demographics",
          attributes: {},
        },
      }
    end

    let(:instance) do
      VisitorDemographicResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { VisitorDemographic.count }.by(1)
    end
  end

  describe "updating" do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    let(:payload) do
      {
        data: {
          id: visitor_demographic.id.to_s,
          type: "visitor_demographics",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      VisitorDemographicResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { visitor_demographic.reload.updated_at }
      # .and change { visitor_demographic.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:visitor_demographic) { create(:visitor_demographic) }

    let(:instance) do
      VisitorDemographicResource.find(id: visitor_demographic.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { VisitorDemographic.count }.by(-1)
    end
  end
end
