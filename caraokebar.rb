#bar can handle the billing o drinks and @rooms_array. #bar only has 5 @rooms_array
class Caraokebar
  attr_reader :rooms_array
  def initialize(rooms_array)
    @rooms_array = rooms_array
  end
    def select_room(room_num)
      if room_num > @rooms_array.length || find_rooms(room_num) == nil || @rooms_array[room_num].room_booked == true
        return "Please select a room that's currently available."
      else
       @rooms_array[room_num].book_room(room_num)
       return "Room Booked"
    end

  end


  def find_rooms(num)
    @rooms_array.find_index{|i| i.room_id == num}
  end

  def change_to_index(choice)
   return choice-1
  end
  # def select_room(room_to_book)
  #   for room in @@rooms_array
  #     if room.room_id == room_to_book
  #       if room.room_booked
  #         return "Please select a room that's currently available."
  #     else
  #       # room.room_booked = true
  #       return room.book_room(self)
  #     end
  #       #return "Please select a room that's currently available."
  #     end
  #   end
    #@@rooms_array.find
    # return "Room Booked
    # @@rooms_array[0] == room_to_book.room_id
    # @@rooms_array[0].room_id

    # @@rooms_array[0].room_id

    # @@rooms_array
  
end