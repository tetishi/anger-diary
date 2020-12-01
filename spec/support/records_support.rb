# frozen_string_literal: true

module RecordsSupport
  def create_success_record
    visit success_records_path
    click_on "今日出来たことを記録する"
    fill_in "今日出来たこと", with: @success_record.success_body
    click_on "登録する"

    assert_text "今日出来たことが作成されました。"
    click_on "戻る"
  end

  def create_anger_record
    visit anger_records_path
    click_on "怒りを記録する"
    select @anger_record.level, from: "怒りのレベル"
    fill_in "怒った日時", with: @anger_record.got_angry_on
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
  end
end

RSpec.configure do |config|
  config.include RecordsSupport
end
