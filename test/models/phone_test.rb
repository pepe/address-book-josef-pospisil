require "test_helper"

class PhoneTest < ActiveSupport::TestCase
  test "validness" do
    vp = Phone.new(number: "+420 777 888 999", person: people(:one))
    assert vp.valid?
    ip = Phone.new(person: people(:one))
    assert_not ip.valid?
  end
end
