class Room

  attr_reader :room_id, :room_booked, :guests_array, :songs_array
  def initialize(room_id)
    @guests_array = Array.new
    @songs_array = Array.new
    @cost = 10
    @room_id = room_id
    @room_booked == false
  end

  def put_guest_in_room(guest)
    if @guests_array.count < 4
      @guests_array.push(guest)
    else
      "Sorry that room is full"
    end
  end

  def take_guest_out_of_room(guest)
    @guests_array.delete_if { |person| person.guest_name == guest.guest_name }
  end

  def add_song_to_room(song)
    @songs_array << song
  end

  def book_room(room_to_book)
    if @room_booked == true
      return false
    else
      @room_booked = true
    end
  end
  
end