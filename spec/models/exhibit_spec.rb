require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    it { should have_many(:exhibit_comments) }

    it { should belong_to(:attraction) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
