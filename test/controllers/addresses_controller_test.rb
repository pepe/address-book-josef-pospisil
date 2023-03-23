require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should not get index without login" do
    get person_addresses_url(@address.person)
    assert_redirected_to "/logout"
  end

  test "should get index" do
    login(:one)
    get person_addresses_url(@address.person)
    assert_response :success
  end

  test "should get new" do
    login(:one)
    get new_person_address_url(@address.person)
    assert_response :success
  end

  test "should create address" do
    login(:one)
    assert_difference('Address.count') do
      post person_addresses_url(@address.person), params: { address: { country: @address.country, person_id: @address.person_id, state: @address.state, street: @address.street, town: @address.town, zip: @address.zip } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show address" do
    login(:one)
    get address_url(@address)
    assert_response :success
  end

  test "should not show address not belonging" do
    login(:one)
    get address_url(addresses(:two))
    assert_redirected_to "/logout"
  end

  test "should get edit" do
    login(:one)
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    login(:one)
    patch address_url(@address), params: { address: { country: @address.country, person_id: @address.person_id, state: @address.state, street: @address.street, town: @address.town, zip: @address.zip } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    login(:one)
    assert_difference('Address.count', -1) do
      delete address_url(@address)
    end

    assert_redirected_to person_addresses_url(@address.person)
  end
end
