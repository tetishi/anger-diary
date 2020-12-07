# frozen_string_literal: true

require "rails_helper"

feature "SuccessRecords", js: true, type: :feature do
  background do
    @success_record = create(:success_record)
  end

  # scenario "visiting the index" do
  #   visit success_records_path
  #   expect(page).to have_selector "h1", text: "今日出来たこと"
  # end

  scenario "creatting a success record" do
    visit root_path
    click_on "今日出来たことを記録する", match: :first
    fill_in "今日出来たこと", with: @success_record.success_body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "OK"
  end

  scenario "updating a success record" do
    visit calendar_path(Date.today.to_s)
    # binding.pry
    click_on "編集"

    fill_in "今日出来たこと", with: "test test"
    click_on "更新する"

    assert_text "今日出来たことが編集されました。"
    click_on "戻る"
  end

  # scenario "destroying a success record" do
  #   visit success_records_path
  #   page.accept_confirm do
  #     click_on "削除", match: :first
  #   end

  #   assert_text "今日出来たことが削除されました。"
  # end
end
