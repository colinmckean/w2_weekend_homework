class Song
attr_reader :song_cost, :song_title, :song_artist
  def initialize(song_title, song_artist)
    @song_title = song_title
    @song_artist = song_artist
    @song_cost = 10
  end

end