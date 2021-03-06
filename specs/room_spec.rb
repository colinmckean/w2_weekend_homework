require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Tab')
class TestRoom < Minitest::Test
  def setup
    @room = Room.new(0)
    @guest = Guest.new("Drake", Tab.new)
    @room2 = Room.new(1)
    @guest2 = Guest.new("Lukas",Tab.new)
    @room3 = Room.new(2)
    @guest3 = Guest.new("Rihanna",Tab.new)
    @room4 = Room.new(3)
    @guest4 = Guest.new("Mike",Tab.new)
    @room5 = Room.new(4)
    @guest5 = Guest.new("Calvin", Tab.new)
    @room6 = Room.new(5)
    @guest6 = Guest.new("Zara", Tab.new)
    @song = Song.new("CAN'T STOP THE FEELING", "JUSTIN TIMBERLAKE")
  end

  def test_empty_room
    assert_equal(0, @room.guests_array.length)
  end

  def test_put_guest_in_room
    @room.put_guest_in_room(@guest)
    assert_equal(50, @guest.guest_tab.tab_amount)
    @room.put_guest_in_room(@guest2)
    assert_equal(2, @room.guests_array.length())
  end

  def test_take_guest_out_of_room
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    @room.put_guest_in_room(@guest3)
    @room.take_guest_out_of_room(@guest.guest_name)
    assert_equal(2, @room.guests_array.length)
  end
  def test_what_happens_with_more_than_four_guests
    @room.put_guest_in_room(@guest)
    @room.put_guest_in_room(@guest2)
    @room.put_guest_in_room(@guest3)
    @room.put_guest_in_room(@guest4)
    assert_equal(4, @room.guests_array.length)
    assert_equal("Sorry that room is full", @room.put_guest_in_room(@guest5))
    assert_equal(4, @room.guests_array.length)
  end

  def test_check_song_queue
    assert_equal(0, @room.songs_array.length)
  end

  def test_add_song_to_room
    @room.add_song_to_room(@guest,@song)
    assert_equal(1, @room.songs_array.length)
  end

  def test_charge_for_room
    assert_equal(50, @room.charge_guest_for_room(@guest,50))
    assert_equal(50, @guest.guest_tab.tab_amount)
    assert_equal(50, @room.charge_guest_for_room(@guest,100))
    @room.add_song_to_room(@guest,@song)
    @room.add_song_to_room(@guest,@song)
    assert_equal(70, @guest.guest_tab.tab_amount)
  end

  def test_find_index_of_guest_in_room
        @room.put_guest_in_room(@guest)
        @room.put_guest_in_room(@guest2)
        @room.put_guest_in_room(@guest3)
        @room.put_guest_in_room(@guest4)
        assert_equal(2, @room.find_index_of_someone_in_room("Rihanna"))
  end
end
