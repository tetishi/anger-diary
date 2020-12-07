# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  context "with only an anger record" do
    background do
      @anger_record = create(:anger_record)
    end
    # scenario "seeing an anger" do
    # 代わりにmodelでvalidationをテストする。記録は全部の項目を入れないと作れないことになっているか上記のテストはなくて大丈夫

    scenario "destroying an anger record" do
      visit calendar_path(@anger_record.got_angry_on)

      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "怒りの記録が削除されました。"
    end
  end

  context "with only a success record" do
    background do
      @success_record = create(:success_record)
    end

    scenario "destroying a success record" do
      visit calendar_path(Date.today.to_s)
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "今日出来たことの記録が削除されました。"
    end
  end

  context "with both an anger record and a success record" do
    background do
      @anger_record = create(:anger_record, got_angry_on: Date.today)
      @success_record = create(:success_record)
    end

    scenario "updating an anger record and a success record" do
      visit calendar_path(Date.today.to_s)

      click_on "編集"

      within "#anger_level" do
        select "6"
      end
      within "#anger_date" do
        fill_in with: "2019-12-22"
      end
      within "#anger_hour" do
        select "13"
      end
      within "#anger_place" do
        fill_in with: "test test"
      end
      within "#anger_body" do
        fill_in with: "test test test"
      end
      within "#anger_changeable" do
        find("input[value='Yes']").set(true)
      end
      within "#anger_important" do
        find("input[value='Yes']").set(true)
      end
      within "#success_body" do
        fill_in with: "test test test"
      end
      click_on "更新する"

      assert_text "怒りと今日出来たことの記録が編集されました。"
      click_on "戻る"
    end

    scenario "destroying an anger record and a success record" do
      visit calendar_path(Date.today.to_s)
      page.accept_confirm do
        click_on "削除"
      end

      assert_text "怒りと今日出来たことの記録が削除されました。"
    end
  end
end
