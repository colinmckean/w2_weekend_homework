require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Caraokebar')


class TestRoom < Minitest::Test
  def setup
    @caraokebar = Caraokebar.new
    # @room_1 = Room.new
    # @room_2= Room.new
    # @room_3 = Room.new
    # @room_4 = Room.new
    # @room_5 = Room.new
    # @room_6 = Room.new
  end

# def test_can_can_only_select_a_room_that_exists
#   assert_equal("Room Booked", @caraokebar.select_room(2))
#   assert_equal("Please select a room that's currently available.", @caraokebar.select_room(3))
# end

def test_room_can_be_booked
  assert_equal(true, @caraokebar.select_room(1))
  
end

end