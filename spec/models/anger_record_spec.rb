# frozen_string_literal: true

require "rails_helper"

describe AngerRecord, type: :model do
  before do
    @anger_record = create(:anger_record)
  end

  it "is valid with valid attributes" do
    expect(@anger_record).to be_valid
  end

  it "is not valid without a level" do
    @anger_record.level = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without a date" do
    @anger_record.got_angry_on = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without an hour" do
    @anger_record.got_angry_at = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without a place" do
    @anger_record.place = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without a body" do
    @anger_record.anger_body = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without a checked changeable" do
    @anger_record.changeable = nil
    expect(@anger_record).to_not be_valid
  end
  it "is not valid without a checked important" do
    @anger_record.important = nil
    expect(@anger_record).to_not be_valid
  end
end
