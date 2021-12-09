require 'rails_helper'

RSpec.describe AttractionComment, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:attraction) }

    it { should belong_to(:commenter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
