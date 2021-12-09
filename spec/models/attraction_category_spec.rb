require "rails_helper"

RSpec.describe AttractionCategory, type: :model do
  describe "Direct Associations" do
    it { should have_many(:attractions) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
