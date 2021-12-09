require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:demographic) }

    it { should belong_to(:user_type) }

    it { should have_many(:requests) }

    it { should have_many(:bookmarks) }

    it { should have_many(:exhibit_comments) }

    it { should have_many(:attraction_comments) }
  end

  describe "InDirect Associations" do
    it { should have_many(:attractions) }

    it { should have_many(:exhibits) }
  end

  describe "Validations" do
  end
end
