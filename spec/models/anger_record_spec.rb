require 'rails_helper'

describe AngerRecord, type: :model do
  before do
    @anger_record = create(:anger_record)
  end

  it 'has a valid factory of anger_record' do
    anger_record = @anger_record
    expect(anger_record).to be_valid
  end

  it 'is valid with level, datetime, place, body, changeable and important' do
    anger_record = @anger_record
    
  end

#   describe '#create' do
#     it 'creats an anger record' do
#       visit anger_record_path
#       anger_record = create(:anger_record)
#       expect(anger_record).to be_valid
#       p anger_record
#     end
#   end
end
