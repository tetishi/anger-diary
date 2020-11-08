require 'rails_helper'

describe AngerRecord, type: :model do
  before do
    @anger_record = create(:anger_record)
  end

  it 'has a valid factory of anger_record' do
    anger_record = @anger_record
    expect(anger_record).to be_valid
  end
end
