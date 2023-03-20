require "test_helper"

class PersonTest < ActiveSupport::TestCase
  test "validness" do
    vp1 = Person.new(first_name: "Joska", last_name: "koska")
    assert vp1.valid?
    ip1 = Person.new(first_name: "Joska")
    assert_not ip1.valid?
    ip2 = Person.new(last_name: "Koska")
    assert_not ip2.valid?
    vp2 = Person.new(first_name: "Joska", last_name: "koska", salutation: "Mr.")
    assert vp2.valid?
    ip3 = Person.new(first_name: "Joska", last_name: "koska", salutation: "Ing.")
    assert_not ip3.valid?
    # do not fight the views
    vp3 = Person.new(first_name: "Joska", last_name: "koska", salutation: "")
    assert vp3.valid?

  end
end
