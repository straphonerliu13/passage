require "rails_helper"

RSpec.describe ApprovalStatus, type: :model do
  describe "Direct Associations" do
    it { should have_many(:requests) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
