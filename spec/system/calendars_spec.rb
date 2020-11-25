# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @anger_record = create(:anger_record)
    @success_record = create(:success_record)

    # @anger_dates = AngerRecord.all.pluck(:got_angry_on).map { |date| date.to_s }
    # @success_dates = SuccessRecord.all.pluck(:created_at).map(&:to_date)
    # @success_dates = @success_dates.uniq.map { |date| date.to_s }
    # @record_dates = (@anger_dates | @success_dates).map { |date| date.to_s }.uniq
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  scenario "creatting an anger record" do
    visit anger_records_path
    click_on "怒りを記録する"
    select "1", from: "怒りのレベル"
    fill_in "怒った日時", with: "2020-11-22"
    within "#anger_hour" do
      select "13"
    end
    fill_in "場所", with: @anger_record.place
    fill_in "内容", with: @anger_record.body
    find("input[name='anger_record[changeable]'][value='Yes']").set(true)
    find("input[name='anger_record[important]'][value='Yes']").set(true)
    click_on "登録する"

    assert_text "怒りの記録が作成されました。"
    click_on "戻る"
  end

  scenario "creatting a success record" do
    visit success_records_path
    click_on "今日出来たことを記録する"
    fill_in "今日出来たこと", with: @success_record.body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "戻る"
  end

  scenario "visiting a detail page" do
    visit calendars_path
    expect(page).to have_text "11月"
    # save_and_open_page
    click_on "25"
    # expect(page).to have_text "2020-11-22"
    # expect(page).to have_selector "p", text: "1"
    # expect(page).to have_selector "p", text: "2020-11-22 13時ごろ"
    # expect(page).to have_selector "p", text: @anger_record.place
    # expect(page).to have_selector "p", text: @anger_record.body
    # expect(page).to have_selector "p", text: "Yes"
    # expect(page).to have_selector "p", text: "Yes"
    # expect(page).to_not have_selector "p", text: "出来たこと"
    expect(page).to have_selector "body", text: "2020-11-25"
    expect(page).to_not have_selector "p", text: "怒りのレベル"
    expect(page).to_not have_selector "p", text: "怒った日時"
    expect(page).to_not have_selector "p", text: "場所"
    expect(page).to_not have_selector "p", text: "内容"
    expect(page).to_not have_selector "p", text: "変えられる内容か"
    expect(page).to_not have_selector "p", text: "重要な内容か"
    expect(page).to have_selector "p", text: @success_record.body
  end
end
