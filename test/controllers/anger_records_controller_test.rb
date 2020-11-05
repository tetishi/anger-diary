require 'test_helper'

class AngerRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anger_record = anger_records(:one)
  end

  test "should get index" do
    get anger_records_url
    assert_response :success
  end

  test "should get new" do
    get new_anger_record_url
    assert_response :success
  end

  test "should create anger_record" do
    assert_difference('AngerRecord.count') do
      post anger_records_url, params: { anger_record: { body: @anger_record.body, place: @anger_record.place } }
    end

    assert_redirected_to anger_record_url(AngerRecord.last)
  end

  test "should show anger_record" do
    get anger_record_url(@anger_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_anger_record_url(@anger_record)
    assert_response :success
  end

  test "should update anger_record" do
    patch anger_record_url(@anger_record), params: { anger_record: { body: @anger_record.body, place: @anger_record.place } }
    assert_redirected_to anger_record_url(@anger_record)
  end

  test "should destroy anger_record" do
    assert_difference('AngerRecord.count', -1) do
      delete anger_record_url(@anger_record)
    end

    assert_redirected_to anger_records_url
  end
end
