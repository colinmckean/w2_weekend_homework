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
    @room3 = Room.new
    @guest3 = Guest.new("The Colin")
    @room4 = Room.new
    @guest4 = Guest.new("SirColin")
    @room5 = Room.new
    @guest5 = Guest.new("His Royal Greatness Colin")
    @room6 = Room.new
    @guest6 = Guest.new("Just Colin")
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
  def test_what_happens_with_more_than_four_guests
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest1)
    @room.put_guest_in_room(@guest2)
    @room.put_guest_in_room(@guest3)
    assert_equal(4, @room.capacity())
    assert_equal("Sorry that room is full", @room.put_guest_in_room(@guest5))
    assert_equal(4, @room.capacity())



    
  end
end
