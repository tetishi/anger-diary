# frozen_string_literal: true

require "rails_helper"

feature "SuccessRecords", js: true, type: :feature do
  background do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario "creatting a success record" do
    @success_record = build(:success_record, user: @user)

    visit root_path
    click_on "今日出来たことを記録する", match: :first
    fill_in "今日出来たこと", with: @success_record.success_body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "OK"
  end

  scenario "updating a success record" do
    @success_record = create(:success_record, user: @user)

    visit calendar_path(Date.today)
    click_on "編集"

    fill_in "今日出来たこと", with: "test test"
    click_on "更新する"

    assert_text "今日出来たことが編集されました。"
    click_on "戻る"
  end
end
