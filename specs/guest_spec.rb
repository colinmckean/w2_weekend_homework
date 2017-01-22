require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Tab')

class TestGuest < Minitest::Test
  def setup
    @room = Room.new(0)
    @guest = Guest.new("Colin", Tab.new)
    @room2 = Room.new(1)
    @guest2 = Guest.new("Mr Colin", Tab.new)

  end
  def test_tab_amount
    assert_equal(0, @guest.guest_tab.tab_amount)
    assert_equal(0, @guest2.guest_tab.tab_amount)
  end

  def test_tab_adding_and_taking_payment
    assert_equal(10, @guest.guest_tab.put_on_tab(10))
    assert_equal(15, @guest2.guest_tab.put_on_tab(15))
    assert_equal(4, @guest.guest_tab.take_payment(6))
    assert_equal(9, @guest2.guest_tab.take_payment(6))
  end
end