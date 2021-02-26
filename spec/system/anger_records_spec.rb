# frozen_string_literal: true

require "rails_helper"

feature "AngerRecords", js: true, type: :feature do
  background do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario "creatting an anger record" do
    @anger_record = build(:anger_record, user: @user)

    visit root_path
    click_on "怒りを記録する", match: :first
    select @anger_record.level, from: "怒りのレベル"
    fill_in "怒った日時", with: @anger_record.got_angry_on
    within "#anger_hour" do
      select @anger_record.got_angry_at.strftime("%H")
    end
    fill_in "場所", with: @anger_record.place
    fill_in "内容", with: @anger_record.anger_body
    find("input[name='anger_record[changeable]'][value='はい']").set(@anger_record.changeable)
    find("input[name='anger_record[important]'][value='はい']").set(@anger_record.important)
    click_on "登録する"

    assert_text "怒りの記録が作成されました。"
    click_on "戻る"
  end

  context "with an anger record" do
    background do
      @anger_record = create(:anger_record, user: @user)
    end

    scenario "updating an anger record" do
      visit calendar_path(@anger_record.got_angry_on)
      click_on "編集"

      select "6", from: "怒りのレベル"
      fill_in "怒った日時", with: "2019-12-20"
      within "#anger_hour" do
        select "13"
      end
      fill_in "場所", with: "test test"
      fill_in "内容", with: "test test test"
      find("input[name='anger_record[changeable]'][value='はい']").set(true)
      find("input[name='anger_record[important]'][value='はい']").set(true)
      click_on "更新する"

      assert_text "怒りの記録が編集されました。"
      click_on "戻る"
    end

    scenario "displaying a place error message" do
      visit calendar_path(@anger_record.got_angry_on)
      click_on "編集"

      fill_in "場所", with: ""
      click_on "更新する"

      assert_text "場所を入力してください"
      click_on "戻る"
    end

    scenario "displaying a body error message" do
      visit calendar_path(@anger_record.got_angry_on)
      click_on "編集"

      fill_in "内容", with: ""
      click_on "更新する"

      assert_text "内容を入力してください"
      click_on "戻る"
    end
  end
end
