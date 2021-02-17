# frozen_string_literal: true

require "rails_helper"

feature "SuccessRecords", js: true, type: :feature do
  background do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario "creating a success record" do
    @success_record = build(:success_record, user: @user)

    visit root_path
    click_on "今日出来たことを記録する", match: :first
    fill_in "今日出来たこと", with: @success_record.success_body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "OK"
  end

  scenario "editing a success record after creating it" do
    @success_record = build(:success_record, user: @user)

    visit root_path
    click_on "今日出来たことを記録する", match: :first
    fill_in "今日出来たこと", with: @success_record.success_body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "編集"
    fill_in "内容", with: "test"
    click_on "更新"

    expect(page).to have_content "test"
    click_on "OK"
  end

  context "with a success record" do
    background do
      @success_record = create(:success_record, user: @user)
    end

    scenario "updating a success record" do
      visit calendar_path(Date.today)
      click_on "編集"

      fill_in "出来たこと", with: "test test"
      click_on "更新"

      assert_text "出来たことが編集されました。"
      click_on "戻る"
    end

    scenario "displaying an error message" do
      visit calendar_path(Date.today)
      click_on "編集"

      fill_in "出来たこと", with: ""
      click_on "更新"

      assert_text "出来たことを入力してください"
      click_on "戻る"
    end

    scenario "displaying an alert when a success record is already created" do
      visit root_path

      page.accept_confirm("すでに今日出来たことが登録されています。") do
        click_on "今日出来たことを記録する", match: :first
      end
    end
  end
end
