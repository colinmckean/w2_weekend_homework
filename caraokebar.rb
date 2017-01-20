#bar can handle the billing o drinks and rooms. #bar only has 5 rooms
class Caraokebar
  def initialize()
    @rooms = Array.new(5) { |i| i = Room.new }

  end

  def select_room(room_to_book)
    for room in @rooms
      if room.room_id == room_to_book
        if room.room_booked
          return "Please select a room that's currently available."
      else
        # room.room_booked = true
        return room.book_room(self)
      end
        #return "Please select a room that's currently available."
      end
    end
    #@rooms.find
    # return "Room Booked
    # @rooms[0] == room_to_book.room_id
    # @rooms[0].room_id

    # @rooms[0].room_id

    # @rooms
    end
end