require "rails_helper"

RSpec.describe RecordingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "recordings",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RecordingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Recording.count }.by(1)
    end
  end

  describe "updating" do
    let!(:recording) { create(:recording) }

    let(:payload) do
      {
        data: {
          id: recording.id.to_s,
          type: "recordings",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RecordingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { recording.reload.updated_at }
      # .and change { recording.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:recording) { create(:recording) }

    let(:instance) do
      RecordingResource.find(id: recording.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Recording.count }.by(-1)
    end
  end
end
