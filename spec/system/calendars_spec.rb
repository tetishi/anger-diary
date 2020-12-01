# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @anger_record = build(:anger_record)
    # @anger_record = build(:anger_record, got_angry_on: Date.today)
    @success_record = build(:success_record)
    # createで省略できるかも
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  context "with only an anger record" do
    scenario "seeing an anger record on a calendar" do
      create_anger_record

      visit calendar_path(@anger_record.got_angry_on)

      expect(page).to have_text @anger_record.got_angry_on.to_s
      selectors = [
        @anger_record.level,
        @anger_record.got_angry_on,
        @anger_record.got_angry_at.strftime("%k"),
        @anger_record.place,
        @anger_record.anger_body,
        @anger_record.changeable,
        @anger_record.important
      ]
      selectors.each do |selector|
        expect(page).to have_selector "p", text: selector
      end
      expect(page).to_not have_selector "p", text: "出来たこと"

      visit anger_records_path
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "怒りの記録が削除されました。"
    end
  end

  context "with only a success record" do
    scenario "seeing a success record on a calendar" do
      create_success_record

      visit calendar_path(Date.today.to_s)

      expect(page).to have_selector "body", text: Date.today.to_s
      selectors = [
        "怒りのレベル",
        "怒った日時",
        "場所",
        "内容",
        "変えられる内容か",
        "重要な内容か"
      ]
      selectors.each do |selector|
        expect(page).to_not have_selector "p", text: selector
      end
      expect(page).to have_selector "p", text: @success_record.success_body

      visit success_records_path
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "今日出来たことが削除されました。"
    end
  end

  context "with both an anger record and a success record" do
    scenario "seeing an anger record and a success record on a calendar" do
      visit anger_records_path
      click_on "怒りを記録する"
      select @anger_record.level, from: "怒りのレベル"
      fill_in "怒った日時", with: Date.today
      within "#anger_hour" do
        select @anger_record.got_angry_at.strftime("%H")
      end
      fill_in "場所", with: @anger_record.place
      fill_in "内容", with: @anger_record.anger_body
      find("input[name='anger_record[changeable]'][value='Yes']").set(@anger_record.changeable)
      find("input[name='anger_record[important]'][value='Yes']").set(@anger_record.important)
      click_on "登録する"

      assert_text "怒りの記録が作成されました。"
      click_on "戻る"

      create_success_record

      visit calendar_path(Date.today.to_s)
      expect(page).to have_text Date.today.to_s
      selectors = [
        @anger_record.level,
        Date.today.to_s,
        @anger_record.got_angry_at.strftime("%k"),
        @anger_record.place,
        @anger_record.anger_body,
        @anger_record.changeable,
        @anger_record.important,
        @success_record.success_body
      ]
      selectors.each do |selector|
        expect(page).to have_selector "p", text: selector
      end
    end
  end
end
