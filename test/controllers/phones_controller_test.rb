require "test_helper"

class PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should not get index without login" do
    get person_phones_url(@phone.person)
    assert_redirected_to "/logout"
  end

  test "should get index" do
    login(:one)
    get person_phones_url(@phone.person)
    assert_response :success
  end

  test "should get new" do
    login(:one)
    get new_person_phone_url(@phone.person)
    assert_response :success
  end

  test "should create phone" do
    login(:one)
    assert_difference('Phone.count') do
      post person_phones_url(@phone.person), params: { phone: { comment: @phone.comment, number: @phone.number, person_id: @phone.person_id } }
    end

    assert_redirected_to phone_url(Phone.last)
  end

  test "should show phone" do
    login(:one)
    get phone_url(@phone)
    assert_response :success
  end

  test "should get edit" do
    login(:one)
    get edit_phone_url(@phone)
    assert_response :success
  end

  test "should update phone" do
    login(:one)
    patch phone_url(@phone), params: { phone: { comment: @phone.comment, number: @phone.number, person_id: @phone.person_id } }
    assert_redirected_to phone_url(@phone)
  end

  test "should destroy phone" do
    login(:one)
    assert_difference('Phone.count', -1) do
      delete phone_url(@phone)
    end

    assert_redirected_to person_phones_url(@phone.person)
  end
end
