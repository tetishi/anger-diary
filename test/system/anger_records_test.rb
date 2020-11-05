require "application_system_test_case"

class AngerRecordsTest < ApplicationSystemTestCase
  setup do
    @anger_record = anger_records(:one)
  end

  test "visiting the index" do
    visit anger_records_url
    assert_selector "h1", text: "Anger Records"
  end

  test "creating a Anger record" do
    visit anger_records_url
    click_on "New Anger Record"

    fill_in "Body", with: @anger_record.body
    fill_in "Place", with: @anger_record.place
    click_on "Create Anger record"

    assert_text "Anger record was successfully created"
    click_on "Back"
  end

  test "updating a Anger record" do
    visit anger_records_url
    click_on "Edit", match: :first

    fill_in "Body", with: @anger_record.body
    fill_in "Place", with: @anger_record.place
    click_on "Update Anger record"

    assert_text "Anger record was successfully updated"
    click_on "Back"
  end

  test "destroying a Anger record" do
    visit anger_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Anger record was successfully destroyed"
  end
end
