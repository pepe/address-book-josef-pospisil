require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
    @address.person = people(:one)
  end

  test "should get index" do
    get person_addresses_url(@address.person)
    assert_response :success
  end

  test "should get new" do
    get new_person_address_url(@address.person)
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post person_addresses_url(@address.person), params: { address: { country: @address.country, person_id: @address.person_id, state: @address.state, street: @address.street, town: @address.town, zip: @address.zip } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { country: @address.country, person_id: @address.person_id, state: @address.state, street: @address.street, town: @address.town, zip: @address.zip } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to person_addresses_url(@address.person)
  end
end
