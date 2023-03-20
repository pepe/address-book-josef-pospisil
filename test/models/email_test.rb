require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "validness" do
    ve = Email.new(address: "josef@pospisil.work", person: people(:one))
    assert ve.valid?
    ie = Email.new(person: people(:one))
    assert_not ie.valid?
  end
end
