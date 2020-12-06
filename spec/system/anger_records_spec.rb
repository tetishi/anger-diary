# frozen_string_literal: true

require "rails_helper"

feature "AngerRecords", js: true, type: :feature do
  background do
    @anger_record = create(:anger_record)
  end

  # scenario "visiting the index" do
  #   visit anger_records_path
  #   expect(page).to have_selector "h1", text: "怒りの記録"
  # end

  scenario "creatting an anger record" do
    create_anger_record
  end

  scenario "updating an anger record" do
    visit anger_records_path
    click_on "編集", match: :first

    select "6", from: "怒りのレベル"
    fill_in "怒った日時", with: "2019-12-22"
    within "#anger_hour" do
      select "13"
    end
    fill_in "場所", with: @anger_record.place
    fill_in "内容", with: @anger_record.anger_body
    find("input[name='anger_record[changeable]'][value='Yes']").set(true)
    find("input[name='anger_record[important]'][value='Yes']").set(true)
    click_on "更新する"

    assert_text "怒りの記録が編集されました。"
    click_on "戻る"
  end

  # scenario "destroying an anger record" do
  #   visit anger_records_path
  #   page.accept_confirm do
  #     click_on "削除", match: :first
  #   end

  #   assert_text "怒りの記録が削除されました。"
  # end
end
