require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
    @email.person = people(:one)
  end

  test "should get index" do
    get person_emails_url(@email.person)
    assert_response :success
  end

  test "should get new" do
    get new_person_email_url(@email.person)
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post person_emails_url(@email.person), params: { email: { address: @email.address, comment: @email.comment, person_id: @email.person_id } }
    end

    assert_redirected_to email_url(Email.last)
  end

  test "should show email" do
    get email_url(@email)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_url(@email)
    assert_response :success
  end

  test "should update email" do
    patch email_url(@email), params: { email: { address: @email.address, comment: @email.comment, person_id: @email.person_id } }
    assert_redirected_to email_url(@email)
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to person_emails_url(@email.person)
  end
end
