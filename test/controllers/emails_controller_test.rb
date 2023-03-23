require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email = emails(:one)
  end

  test "should not get index without session user" do
    get person_emails_url(@email.person)
    assert_redirected_to "/logout"
  end

  test "should get index" do
    login(:one)
    get person_emails_url(@email.person)
    assert_response :success
  end

  test "should get new" do
    login(:one)
    get new_person_email_url(@email.person)
    assert_response :success
  end

  test "should create email" do
    login(:one)
    assert_difference('Email.count') do
      post person_emails_url(@email.person), params: { email: { address: @email.address, comment: @email.comment, person_id: @email.person_id } }
    end

    assert_redirected_to email_url(Email.last)
  end

  test "should show email" do
    login(:one)
    get email_url(@email)
    assert_response :success
  end

  test "should not show email for other person" do
    login(:one)
    get email_url(emails(:two))
    assert_redirected_to "/logout"
  end

  test "should get edit" do
    login(:one)
    get edit_email_url(@email)
    assert_response :success
  end

  test "should update email" do
    login(:one)
    patch email_url(@email), params: { email: { address: @email.address, comment: @email.comment, person_id: @email.person_id } }
    assert_redirected_to email_url(@email)
  end

  test "should destroy email" do
    login(:one)
    assert_difference('Email.count', -1) do
      delete email_url(@email)
    end

    assert_redirected_to person_emails_url(@email.person)
  end
end
