require "test_helper"

class AddressTest < ActiveSupport::TestCase
  setup do
    @person = people(:one)
  end

  test "validnes" do
    va = Address.new(street: "Bottom 1", town: "New one", zip: "45645", person: @person)
    assert va.valid?
    ia1 = Address.new()
    assert_not ia1.valid?
  end
end
