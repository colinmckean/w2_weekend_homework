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
    
end