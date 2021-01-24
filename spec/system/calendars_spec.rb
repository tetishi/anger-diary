# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  context "with an anger record" do
    background do
      @anger_record = create(:anger_record, user: @user)
    end

    scenario "destroying an anger record" do
      visit calendar_path(@anger_record.got_angry_on)
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "怒りの記録が削除されました。"
    end
  end

  context "with a success record" do
    background do
      @success_record = create(:success_record, user: @user)
    end

    scenario "destroying a success record" do
      visit calendar_path(Date.today)
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "今日出来たことを削除しました。"
    end
  end
end
