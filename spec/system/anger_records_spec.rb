require 'rails_helper'

describe 'AngerRecords', type: :system do
  before do
    @anger_record = create(:anger_record)
  end

  it 'visits the index' do
    visit anger_records_path
    expect(page).to have_selector 'h1', text: 'Anger Records'
  end

  it 'creats an anger record' do
    visit anger_records_path
    click_on 'New Anger Record'

    select_option "Level", with: @anger_record.level
    fill_in "Got Angry at", with: @anger_record.got_angry_at
    fill_in "Place", with: @anger_record.place
    fill_in "Body", with: @anger_record.body
    choose 'Is it changeable?', with: @anger_record.changeable
    choose 'Is it important?', with: @anger_record.important
    click_on "Create Anger record"

    assert_text "Anger record was successfully created"
    click_on "Back"
  end
end
