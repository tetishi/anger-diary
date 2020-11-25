# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @anger_record = create(:anger_record)
    @success_record = create(:success_record)
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  scenario "creating an anger_record" do
    visit anger_records_path
    click_on "怒りを記録する"
    select @anger_record.level, from: "怒りのレベル"
    fill_in "怒った日時", with: @anger_record.got_angry_on
    within "#anger_hour" do
      select "13"
    end
    fill_in "場所", with: @anger_record.place
    fill_in "内容", with: @anger_record.body
    # binding.pry
    find("input[name='anger_record[changeable]'][value='Yes']").set(@anger_record.changeable)
    find("input[name='anger_record[important]'][value='Yes']").set(@anger_record.important)
    click_on "登録する"

    assert_text "怒りの記録が作成されました。"
    # binding.pry
    click_on "戻る"
  end
    # binding.pry
  scenario "seeing an anger record on a calendar" do
    visit calendar_path(@anger_record.got_angry_on)
    # expect(page).to have_text "11月"
    # click_on "22" # ここをかえる。インスタンス変数使うとか、match first　とか
    
    # first(".day > a").click

    # save_and_open_page
    # binding.pry
    expect(page).to have_text @anger_record.got_angry_on.to_s
    expect(page).to have_selector "p", text: @anger_record.level
    expect(page).to have_selector "p", text: @anger_record.got_angry_on
    # expect(page).to have_selector "p", text: @anger_record.got_angry_at
    expect(page).to have_selector "p", text: @anger_record.place
    expect(page).to have_selector "p", text: @anger_record.body
    expect(page).to have_selector "p", text: "はい"
    expect(page).to have_selector "p", text: "いいえ"
    expect(page).to_not have_selector "p", text: "出来たこと"
  end

  scenario "creating a success record" do
    visit success_records_path
    click_on "今日出来たことを記録する"
    fill_in "今日出来たこと", with: @success_record.body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "戻る"
  # end

  # scenario "seeing a success record on a calendar" do
    # binding.pry
    visit calendar_path(@success_record.created_at.to_date)
    # expect(page).to have_text "11月"
    # click_on "25"
    # binding.pry
    expect(page).to have_selector "body", text: @success_record.created_at.to_date
    expect(page).to_not have_selector "p", text: "怒りのレベル"
    expect(page).to_not have_selector "p", text: "怒った日時"
    expect(page).to_not have_selector "p", text: "場所"
    expect(page).to_not have_selector "p", text: "内容"
    expect(page).to_not have_selector "p", text: "変えられる内容か"
    expect(page).to_not have_selector "p", text: "重要な内容か"
    expect(page).to have_selector "p", text: @success_record.body
  end
end
