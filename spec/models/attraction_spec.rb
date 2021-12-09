require 'rails_helper'

RSpec.describe Attraction, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:attraction_category) }

    it { should have_many(:requests) }

    it { should have_many(:bookmarks) }

    it { should have_many(:exhibits) }

    it { should have_many(:attraction_comments) }

    end

    describe "InDirect Associations" do

    it { should have_many(:modification_requests) }

    end

    describe "Validations" do

    end
end
