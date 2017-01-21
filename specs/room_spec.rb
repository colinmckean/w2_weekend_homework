require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')

class TestRoom < Minitest::Test
  def setup
    @room = Room.new(0)
    @guest = Guest.new("Colin", 100)
    @room2 = Room.new(1)
    @guest2 = Guest.new("Mr Colin",50 )
    @room3 = Room.new(2)
    @guest3 = Guest.new("The Colin", 20)
    @room4 = Room.new(3)
    @guest4 = Guest.new("SirColin", 30)
    @room5 = Room.new(4)
    @guest5 = Guest.new("His Royal Greatness Colin", 20)
    @room6 = Room.new(5)
    @guest6 = Guest.new("Just Colin", 10)
    @song = Song.new("The Song")
  end

  def test_empty_room
    assert_equal(0, @room.guests_array.length)
  end

  def test_put_guest_in_room
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    assert_equal(2, @room.guests_array.length())
  end

  def test_take_guest_out_of_room
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    @room.take_guest_out_of_room(@guest)
    assert_equal(1, @room.guests_array.length)
  end
  def test_what_happens_with_more_than_four_guests
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest1)
    @room.put_guest_in_room(@guest2)
    @room.put_guest_in_room(@guest3)
    assert_equal(4, @room.guests_array.length)
    assert_equal("Sorry that room is full", @room.put_guest_in_room(@guest5))
    assert_equal(4, @room.guests_array.length)
  end

  def test_check_song_queue
    assert_equal(0, @room.songs_array.length)
  end

  def test_add_song_to_room
    @room.add_song_to_room(@song)
    assert_equal(1, @room.songs_array.length)
  end
end
