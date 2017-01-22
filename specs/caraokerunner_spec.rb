require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Caraokebar')
require_relative ('../Tab')

class Menu
  def initialize
    @rooms = Array.new(5) { |i| i = Room.new(i) }
    @caraokebar = Caraokebar.new(@rooms)
    @song_list = [Song.new("The Song"), Song.new("Another Song"),Song.new("Third Song"),Song.new("Fourth Song"),Song.new("Fith Song"),Song.new("Sixth Song"),Song.new("Seventh Song"),Song.new("Eighth Song"),Song.new("Nineth Song"),Song.new("Tenth Song")]
  end
  def menu_selection
    puts %x{clear}
    puts "Select an option \n\n"
    puts "1. Add guest to room"
    puts "2. View Guests in room"
    puts "3. Add songs to room"
    puts "4. Customer Management"
    puts "Q. quit"
    input = gets.chomp
    case input
    when "1"
      room_selection_menu
    when "2"
      view_guest_menu()
    when "3"
      song_selection
    when "4"
      customer_management()
    when "q"
      exit
    else
      print %x{clear}
      puts  "please enter a valid selection\n\n"
      menu_selection()
    end
  end
  def room_selection_menu
    puts %x{clear}
    puts "Please select a room to add a guest to"
    puts "1. Book guest in to room 1"
    puts "1. Book guest in to room 2"
    puts "1. Book guest in to room 3"
    puts "1. Book guest in to room 4"
    puts "1. Book guest in to room 5"
    puts "9. Main menu"
    input = gets.chomp.to_i
    case input
    when 1
      puts "please also enter a name"
      customer_name = gets.chomp
      guest = Guest.new(customer_name, Tab.new)
      puts @rooms[input-1].put_guest_in_room(guest)
      #puts "#{guest.guest_name} has been added to room 1"
      gets.chomp
    when 2
      puts "please also enter a name"
      customer_name = gets.chomp
      guest = Guest.new(customer_name, Tab.new)
      @rooms[input-1].put_guest_in_room(guest)
    when 3
      puts "please also enter a name"
      customer_name = gets.chomp
      guest = Guest.new(customer_name, Tab.new)
      @rooms[input-1].put_guest_in_room(guest)
    when 4
      puts "please also enter a name"
      customer_name = gets.chomp
      guest = Guest.new(customer_name, Tab.new)
      @rooms[input-1].put_guest_in_room(guest)
    when 5
      puts "please also enter a name"
      customer_name = gets.chomp
      guest = Guest.new(customer_name, Tab.new)
      @rooms[input-1].put_guest_in_room(guest)
    when "9"
      menu_selection()
    else
      print %x{clear}
      puts  "please enter a valid selection\n\n"
      room_selection_menu()
    end
    menu_selection()
  end

  def add_songs_menu(song)
    puts %x{clear}
    puts "ADD SONGS MENU"
    puts "Select a room to add songs to"
    puts "1. Add song to room 1"
    puts "2. Add song to room 2"
    puts "3. Add song to room 3"
    puts "4. Add song to room 4"
    puts "5. Add song to room 5"
    puts "9. Main Menu"
    input = gets.chomp.to_i
    case input
    when 1
      puts "Enter name of customer to bill song request to."
      guest_name_to_find = gets.chomp
      index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
      song = Song.new("A song")
      guest = @rooms[input-1].guests_array[index_of_guest]
      @rooms[input-1].add_song_to_room(guest,song)
      puts "song added and billed to #{guest.guest_name} #{guest.guest_tab.tab_amount}"
      gets.chomp    
    when 2
      puts "Enter name of customer to bill song request to."
      guest_name_to_find = gets.chomp
      index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
      song = Song.new("A song")
      guest = @rooms[input-1].guests_array[index_of_guest]
      @rooms[input-1].add_song_to_room(guest,song)
      puts "song added and billed to #{guest.guest_name} #{guest.guest_tab.tab_amount}"
      gets.chomp
      when 3
      puts "Enter name of customer to bill song request to."
      guest_name_to_find = gets.chomp
      index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
      song = Song.new("A song")
      guest = @rooms[input-1].guests_array[index_of_guest]
      @rooms[input-1].add_song_to_room(guest,song)
      puts "song added and billed to #{guest.guest_name} #{guest.guest_tab.tab_amount}"
      gets.chomp      
    when 4
      puts "Enter name of customer to bill song request to."
      guest_name_to_find = gets.chomp
      index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
      song = Song.new("A song")
      guest = @rooms[input-1].guests_array[index_of_guest]
      @rooms[input-1].add_song_to_room(guest,song)
      puts "song added and billed to #{guest.guest_name} #{guest.guest_tab.tab_amount}"
      gets.chomp
    when 5
      puts "Enter name of customer to bill song request to."
      guest_name_to_find = gets.chomp
      index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
      song = Song.new("A song")
      guest = @rooms[input-1].guests_array[index_of_guest]
      @rooms[input-1].add_song_to_room(guest,song)
      puts "song added and billed to #{guest.guest_name} #{guest.guest_tab.tab_amount}"
      gets.chomp
    when 9
      menu_selection()
    end
    menu_selection()
  end
    def payments(customer_name)
      puts "Welcome to payments for #{customer_name}, enter payment amount"
        
    end
  def customer_management()
    puts %x{clear}
    puts "Welcome to customer Management"
    puts "Enter Customer name"
    customer_name = gets.chomp
    puts "Here are you're options for #{customer_name}"
    puts "1. View #{customer_name}'s' Tab and take payments"
    puts "2. Return to Main Menu"
    puts "7. song selection"
    puts "3. Checkout"
    input = gets.chomp.to_i

    case input
    when 1
      room_ids = 0
      for room in @rooms
        unless room.find_index_of_someone_in_room(customer_name) == nil
          index_of_guest = room.find_index_of_someone_in_room(customer_name)
          room_ids = room.room_id 
        end
      end
      room = @rooms[room_ids]
      #guest = room.find_index_of_someone_in_room(customer_name)
      puts "#{customer_name}'s tab stands at £#{room.guests_array[index_of_guest].guest_tab.tab_amount}"
      # puts room.room_id
      # puts room.find_index_of_someone_in_room(customer_name)
      # puts room_ids_array
      # #puts guest

      puts "Please enter payment amount"
      payment_amount = gets.chomp.to_i
      room.guests_array[index_of_guest].guest_tab.take_payment(payment_amount)

      gets.chomp

    when 2
      menu_selection()
    when 3
      check_out(customer_name)
    when 7
      song_selection()
    end
    customer_management()
  end
  def song_selection
    puts "Select Song"
    @song_list.each {|song| puts "#{song.song_title}"}

    input = gets.chomp.to_i
    add_songs_menu(@song_list[input-1])
    puts "***"
    
  end

  def check_out(customer_name)
    @rooms[0].take_guest_out_of_room(customer_name)
    puts"#{customer_name} has been checked-out, lets hope he paid his tab"
    gets.chomp
    
  end

  def view_guest_menu
    puts %x{clear}
    puts "Please select a room to view add a guest to"
    puts "1. View Guests in room 1 "
    puts "2. View Guests in room 2"
    puts "3. View Guests in room 3"
    puts "4. View Guests in room 4"
    puts "5. View Guests in room 5"
    puts "9. back to previous menu"
    input = gets.chomp
    case input
    when "1"
      puts "In room 1 we have #{@rooms[0].guests_array.length} people"
      @rooms[0].check_who_is_in_a_room    
    when "2"
      @rooms[1].check_who_is_in_a_room    
    when "3"
      @rooms[2].check_who_is_in_a_room    
    when "4"
      @rooms[3].check_who_is_in_a_room    
    when "5"
      @rooms[4].check_who_is_in_a_room
    when "9"
      menu_selection
    end
    gets.chomp
    view_guest_menu()
  end

#find guest in the room, if not found say that guest isn;t in room
  # def guest_selection_meunu(room)
  #   puts "Select Guest"
  #   @rooms[0].check_who_is_in_a_room
  #   input = gets.chomp
  #   case input
  #   when 1
  #     end
  #     guest_selection_meunu(room)
  # end
  @menu = Menu.new
  @menu.menu_selection
end