require "rails_helper"

RSpec.describe Exhibit, type: :model do
  describe "Direct Associations" do
    it { should have_many(:requests) }

    it { should have_many(:recordings) }

    it { should have_many(:bookmarks) }

    it { should have_many(:exhibit_comments) }

    it { should belong_to(:attraction) }
  end

  describe "InDirect Associations" do
    it { should have_many(:users) }

    it { should have_one(:modification_request) }
  end

  describe "Validations" do
  end
end
