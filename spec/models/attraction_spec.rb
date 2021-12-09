require 'rails_helper'

RSpec.describe Attraction, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:attraction_comments) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
