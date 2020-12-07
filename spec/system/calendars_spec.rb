# frozen_string_literal: true

require "rails_helper"

feature "Calendars", js: true, type: :feature do
  background do
    @success_record = create(:success_record)
    @anger_record = build(:anger_record)
    # @anger_record = build(:anger_record, got_angry_on: Date.today)
    # createで省略できるかも
  end

  scenario "visiting the index" do
    visit calendars_path
    expect(page).to have_selector "th", text: "日"
  end

  context "with only an anger record" do
    # scenario "seeing an anger" do
    #   create_anger_record

    #   visit calendar_path(@anger_record.got_angry_on)

    #   expect(page).to have_text @anger_record.got_angry_on.to_s
    #   selectors = [
    #     @anger_record.level,
    #     @anger_record.got_angry_on,
    #     @anger_record.got_angry_at.strftime("%k"),
    #     @anger_record.place,
    #     @anger_record.anger_body,
    #     @anger_record.changeable,
    #     @anger_record.important
    #   ]
    #   selectors.each do |selector|
    #     expect(page).to have_selector "p", text: selector
    #   end
    #   expect(page).to_not have_selector "p", text: "出来たこと"
    # end
    # 代わりにmodelでvalidationをテストする。記録は全部の項目を入れないと作れないことになっているか上記のテストはなくて大丈夫

    # scenario "updating an anger record" do
    #   create_anger_record

    #   visit calendar_path(@anger_record.got_angry_on)

    #   click_on "編集"

    #   select "6", from: "怒りのレベル"
    #   fill_in "怒った日時", with: "2019-12-22"
    #   within "#anger_hour" do
    #     select "13"
    #   end
    #   fill_in "場所", with: @anger_record.place
    #   fill_in "内容", with: @anger_record.anger_body
    #   find("input[name='anger_record[changeable]'][value='Yes']").set(true)
    #   find("input[name='anger_record[important]'][value='Yes']").set(true)
    #   click_on "更新する"

    #   assert_text "怒りの記録が編集されました。"
    #   click_on "戻る"
    # end

    scenario "destroying an anger record" do
      # binding.pry
      create_anger_record

      visit calendar_path(@anger_record.got_angry_on)

      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "怒りの記録が削除されました。"
    end
  end

  context "with only a success record" do
    # scenario "seeing a success record" do
    #   visit calendar_path(Date.today.to_s)
    #   # binding.pry

    #   expect(page).to have_selector "body", text: Date.today.to_s
    #   selectors = [
    #     "怒りのレベル",
    #     "怒った日時",
    #     "場所",
    #     "内容",
    #     "変えられる内容か",
    #     "重要な内容か"
    #   ]
    #   selectors.each do |selector|
    #     expect(page).to_not have_selector "p", text: selector
    #   end
    #   expect(page).to have_selector "p", text: @success_record.success_body
    # end

    # scenario "updating a success record" do
    #   visit calendar_path(Date.today.to_s)
    #   click_on "編集"

    #   fill_in "今日出来たこと", with: @success_record.success_body
    #   click_on "更新する"

    #   click_on "戻る"
    #   assert_text "今日出来たことが編集されました。"
    # end

    scenario "destroying a success record" do
      visit calendar_path(Date.today.to_s)
      # binding.pry
      page.accept_confirm do
        click_on "削除", match: :first
      end

      assert_text "今日出来たことの記録が削除されました。"
    end
  end

  context "with both an anger record and a success record" do
    background do
      @anger_record = create(:anger_record, got_angry_on: Date.today)
    end
    # scenario "seeing an anger record and a success record" do
      # visit root_path
      # # binding.pry
      # click_on "怒りを記録する", match: :first
      # select @anger_record.level, from: "怒りのレベル"
      # fill_in "怒った日時", with: Date.today
      # within "#anger_hour" do
      #   select @anger_record.got_angry_at.strftime("%H")
      # end
      # fill_in "場所", with: @anger_record.place
      # fill_in "内容", with: @anger_record.anger_body
      # find("input[name='anger_record[changeable]'][value='Yes']").set(@anger_record.changeable)
      # find("input[name='anger_record[important]'][value='Yes']").set(@anger_record.important)
      # click_on "登録する"

      # assert_text "怒りの記録が作成されました。"
      # click_on "OK"

      # visit calendar_path(Date.today.to_s)
      # expect(page).to have_text Date.today.to_s
      # selectors = [
      #   @anger_record.level,
      #   Date.today.to_s,
      #   @anger_record.got_angry_at.strftime("%k"),
      #   @anger_record.place,
      #   @anger_record.anger_body,
      #   @anger_record.changeable,
      #   @anger_record.important,
      #   @success_record.success_body
      # ]
      # selectors.each do |selector|
      #   expect(page).to have_selector "p", text: selector
      # end
    # end

    scenario "updating an anger record and a success record" do
      # create_anger_record

      # binding.pry
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
      # create_anger_record

      visit calendar_path(Date.today.to_s)
      page.accept_confirm do
        click_on "削除"
      end

      assert_text "怒りと今日出来たことの記録が削除されました。"
    end
  end
end
