require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')

class TestRoom < Minitest::Test
  def setup
    @room = Room.new
    @guest = Guest.new("Colin")
    @room2 = Room.new
    @guest2 = Guest.new("Mr Colin")
  end
  def test_empty_room
    assert_equal(0, @room.capacity())
  end

  def test_put_guest_in_room
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    assert_equal(2, @room.capacity())
  end

  def test_take_guest_out_of_room
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    @room.take_guest_out_of_room(@guest)
    assert_equal(1, @room.capacity())
  end
end
