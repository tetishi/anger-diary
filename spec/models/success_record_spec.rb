# frozen_string_literal: true

require "rails_helper"

describe SuccessRecord, type: :model do
  before do
    @success_record = create(:success_record)
  end

  describe "#create" do
    it "is valid with body" do
      success_record = @success_record
      success_record.valid?
      expect(success_record).to be_valid
    end
  end
end
