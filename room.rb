class Room

  attr_reader :room_id, :room_booked
@@room_id = 0
  def initialize
    @capacity = Array.new
    #going to come back to this, may have all index = empty and update with guest name when checking in and change to empty when checking out, will need to refactor tests and functions to take in to account this change.
    #@capacity = Array.new(8){|i| i = "empty"}
    @songs = Array.new
    @cost = 10
    @@room_id += 1
    @room_id = @@room_id
    @room_booked == false

  end

  def capacity
    return @capacity.length
  end

  def room_id
    return @room_id
    
  end

  def put_guest_in_room(guest)
    if @capacity.count < 4
      @capacity.push(guest)
    else
      "Sorry that room is full"
    end
  end

  def take_guest_out_of_room(guest)
      @capacity.delete_if { |person| person.guest_name == guest.guest_name }
  end

  def add_song_to_room(song)
    @songs << song
  end

  def check_song_queue
    @songs.length
  end
  def book_room(room_to_book)
    @room_booked = true
  end

end