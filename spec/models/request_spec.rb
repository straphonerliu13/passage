require 'rails_helper'

RSpec.describe Request, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:status) }

    it { should belong_to(:exhibit) }

    it { should belong_to(:attraction) }

    it { should belong_to(:approver) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
