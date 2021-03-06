require "rails_helper"

RSpec.describe Recording, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:exhibit) }
  end

  describe "InDirect Associations" do
    it { should have_one(:attraction) }
  end

  describe "Validations" do
  end
end
