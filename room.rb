class Room

  attr_reader :room_id, :room_booked, :guests_array, :songs_array
  def initialize(room_id)
    @guests_array = Array.new
    @songs_array = Array.new
    @cost = 50
    @room_id = room_id
    @room_booked == false
  end

  def put_guest_in_room(guest)
    if @guests_array.count < 4 && guest != nil
      guest.charge_to_tab(@cost)
      @guests_array.push(guest)
      "Guest has been added to room"
    else
      #this has been updated as a puts for front end output
      "Sorry that room is full"
    end
  end

  def take_guest_out_of_room(guest_name)
    @guests_array.delete_if { |person| person.guest_name == guest_name }
  end

  def add_song_to_room(guest,song)
    guest.charge_to_tab(song.song_cost)
    @songs_array << song
  end

  def book_room(room_to_book)
    if @room_booked == true

      return false
    else
      @room_booked = true
    end
  end
   def charge_guest_for_room(guest, cost)
     guest.charge_to_tab(cost)
   end
   def check_who_is_in_a_room
     for peeps in @guests_array
       puts peeps.guest_name
     end
   end
   def find_index_of_someone_in_room(guest_name)
    guests_array.index {|guest| guest.guest_name == guest_name}
   end

end