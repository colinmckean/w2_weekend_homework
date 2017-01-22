require ('minitest/autorun')
require 'minitest/rg'
require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Caraokebar')


class TestSong < Minitest::Test
  def setup
    @song = Song.new("CAN'T STOP THE FEELING", "JUSTIN TIMBERLAKE")
  end
  def test_song_cost
    assert_equal(10, @song.song_cost)
  end
end