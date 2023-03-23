require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should not get index without login" do
    get people_url
    assert_redirected_to "/login"
  end

  test "should get index" do
    login(:one)
    get people_url
    assert_response :success
  end

  test "should get new" do
    login(:one)
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    login(:one)
    assert_difference('Person.count') do
      post people_url, params: { person: { birth_date: @person.birth_date, comment: @person.comment, first_name: @person.first_name, last_name: @person.last_name, middle_name: @person.middle_name, salutation: @person.salutation, ssn: @person.ssn } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    login(:one)
    get person_url(@person)
    assert_response :success
  end

  test "should not show person for other" do
    login(:one)
    get person_url(people(:two))
    assert_redirected_to "/logout"
  end

  test "should get edit" do
    login(:one)
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    login(:one)
    patch person_url(@person), params: { person: { birth_date: @person.birth_date, comment: @person.comment, first_name: @person.first_name, last_name: @person.last_name, middle_name: @person.middle_name, salutation: @person.salutation, ssn: @person.ssn } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    login(:one)
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
