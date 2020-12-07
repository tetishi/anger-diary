# frozen_string_literal: true

require "rails_helper"

describe SuccessRecord, type: :model do
  before do
    @success_record = create(:success_record)
  end

  describe "#create" do
    it "is valid with valid attributes" do
      expect(@success_record).to be_valid
    end

    it "is not valid without a body" do
      @success_record.success_body = nil
      expect(@success_record).to_not be_valid
    end
  end
end
