# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @anger_record = build(:anger_record)
    @success_record = build(:success_record)
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  context "with only an anger record" do
    scenario "creating an anger record" do
      visit anger_records_path
      click_on "怒りを記録する"
      select @anger_record.level, from: "怒りのレベル"
      fill_in "怒った日時", with: @anger_record.got_angry_on
      binding.pry
      within "#anger_hour" do
        select @anger_record.got_angry_at.strftime("%k")
      end
      fill_in "場所", with: @anger_record.place
      fill_in "内容", with: @anger_record.body
      find("input[name='anger_record[changeable]'][value='Yes']").set(@anger_record.changeable)
      find("input[name='anger_record[important]'][value='Yes']").set(@anger_record.important)
      click_on "登録する"

      assert_text "怒りの記録が作成されました。"
      binding.pry
      click_on "戻る"
      binding.pry
    # end
    # # binding.pry
    # scenario "seeing an anger record on a calendar" do
      visit calendar_path(@anger_record.got_angry_on)
    # expect(page).to have_text "11月"
    # click_on "22"
    
    # first(".day > a").click

      expect(page).to have_text @anger_record.got_angry_on.to_s
      expect(page).to have_selector "p", text: @anger_record.level
      expect(page).to have_selector "p", text: @anger_record.got_angry_on
      binding.pry
      expect(page).to have_selector "p", text: @anger_record.got_angry_at.strftime("%k")
      expect(page).to have_selector "p", text: @anger_record.place
      expect(page).to have_selector "p", text: @anger_record.body
      expect(page).to have_selector "p", text: @anger_record.changeable
      expect(page).to have_selector "p", text: @anger_record.important
      expect(page).to_not have_selector "p", text: "出来たこと"
    # end

    # scenario "destroying an anger record" do
      visit anger_records_path
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "怒りの記録が削除されました。"
    end
  end

  context "with only a success record" do
    scenario "seeing a success record on a calendar" do
      visit success_records_path
      click_on "今日出来たことを記録する"
      fill_in "今日出来たこと", with: @success_record.body
      click_on "登録する"

      assert_text "今日出来たことが作成されました。"
      click_on "戻る"
  # end

  # scenario "seeing a success record on a calendar" do
      visit calendar_path(@success_record.created_at.to_date)
    # expect(page).to have_text "11月"
    # click_on "25"
      expect(page).to have_selector "body", text: @success_record.created_at.to_date
      expect(page).to_not have_selector "p", text: "怒りのレベル"
      expect(page).to_not have_selector "p", text: "怒った日時"
      expect(page).to_not have_selector "p", text: "場所"
      expect(page).to_not have_selector "p", text: "内容"
      expect(page).to_not have_selector "p", text: "変えられる内容か"
      expect(page).to_not have_selector "p", text: "重要な内容か"
      expect(page).to have_selector "p", text: @success_record.body
    # end

    # scenario "destroying a success record" do
      visit success_records_path
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "今日出来たことが削除されました。"
    end
  end

  context "with both an anger record and a success record" do
    scenario "creating an anger record for today" do
      visit anger_records_path
      click_on "怒りを記録する"
      select @anger_record.level, from: "怒りのレベル"
      fill_in "怒った日時", with: Date.today
      within "#anger_hour" do
        select @anger_record.got_angry_at.strftime("%k")
      end
      fill_in "場所", with: @anger_record.place
      fill_in "内容", with: @anger_record.body
      find("input[name='anger_record[changeable]'][value='Yes']").set(@anger_record.changeable)
      find("input[name='anger_record[important]'][value='Yes']").set(@anger_record.important)
      click_on "登録する"

      assert_text "怒りの記録が作成されました。"
      click_on "戻る"
    # end

    # scenario "seeing a success record on a calendar" do
      visit success_records_path
      click_on "今日出来たことを記録する"
      fill_in "今日出来たこと", with: @success_record.body
      click_on "登録する"

      assert_text "今日出来たことが作成されました。"
      click_on "戻る"
    # end

    # scenario "seeing an anger record on a calendar" do
      visit calendar_path(Date.today.to_s)
      expect(page).to have_text Date.today.to_s
      expect(page).to have_selector "p", text: @anger_record.level
      expect(page).to have_selector "p", text: Date.today.to_s
      expect(page).to have_selector "p", text: @anger_record.got_angry_at.strftime("%k")
      expect(page).to have_selector "p", text: @anger_record.place
      expect(page).to have_selector "p", text: @anger_record.body
      expect(page).to have_selector "p", text: @anger_record.changeable
      expect(page).to have_selector "p", text: @anger_record.important
      expect(page).to have_selector "p", text: @success_record.body
    end
  end
end
