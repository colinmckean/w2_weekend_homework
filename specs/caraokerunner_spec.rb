require_relative ('../Room')
require_relative ('../Guest')
require_relative ('../Song')
require_relative ('../Caraokebar')
require_relative ('../Tab')

class Menu
  def initialize
    @rooms = Array.new(5) { |i| i = Room.new(i) }
    @caraokebar = Caraokebar.new(@rooms)
    @song_list = [
      Song.new("The Song"), 
      Song.new("Another Song"),
      Song.new("Third Song"),
      Song.new("Fourth Song"),
      Song.new("Fith Song"),
      Song.new("Sixth Song"),
      Song.new("Seventh Song"),
      Song.new("Eighth Song"),
      Song.new("Nineth Song"),
      Song.new("Tenth Song")
    ]
  end

  def menu_selection()
    puts %x{clear}
    puts "\t   Welcome to CodeClan Caraoke \n\n\t#{"*" * 35} \n\n\tPlease Select an option from below. \n\n"
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
      song_selection()
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
    puts "2. Book guest in to room 2"
    puts "3. Book guest in to room 3"
    puts "4. Book guest in to room 4"
    puts "5. Book guest in to room 5"
    puts "9. Main menu"
    input = gets.chomp.to_i
    if (input >= 1 && input <= 5)
      check_guest_in_to_room(input)
    elsif input == 9
      menu_selection()
    else
      room_selection_menu()
    end
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
    if input >= 1 && input <= 5
      add_song_to_room_menu(input) 
    elsif input == 9
      menu_selection
    else
      add_songs_menu(song)
    end
    menu_selection()
  end

  #this code is currently unused.
  def payments(customer_name)
    puts "Welcome to payments for #{customer_name}, enter payment amount"
  end

  #this works, would like to re-factor and encapsulate code away in seperate functions.
  def customer_management()
    puts %x{clear}
    puts "Welcome to customer Management"
    puts "Enter Customer name"
    customer_name = gets.chomp
    puts "Here are you're options for #{customer_name}"
    puts "1. View #{customer_name}'s' Tab and take payments"
    puts "2. Checkout"
    puts "9. Return to MAIN-MENU"
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
      puts "#{customer_name}'s tab stands at £#{room.guests_array[index_of_guest].guest_tab.tab_amount}"

      puts "Please enter payment amount"
      print "£"
      payment_amount = gets.chomp.to_i
      room.guests_array[index_of_guest].guest_tab.take_payment(payment_amount)

      gets.chomp
    when 2
      check_out(customer_name)
    when 9
      menu_selection()
    end
    menu_selection()
  end

#Can correctly select songs.
def song_selection
  puts %x{clear}
  puts "Select Song"
  song_id = 0
  @song_list.each {|song| puts "#{song_id += 1}, #{song.song_title} by - £#{song.song_cost}"}

  input = gets.chomp.to_i
  if input <= @song_list.length && input >= 1
    add_songs_menu(@song_list[input-1])
  else
    song_selection
  end
  puts "***"
end

#Can now check customers out of rooms.
def check_out(customer_name)
  room_ids = 0
  for room in @rooms
    unless room.find_index_of_someone_in_room(customer_name) == nil
      index_of_guest = room.find_index_of_someone_in_room(customer_name)
      room_ids = room.room_id 
    end
  end
  room_that_has_guest = @rooms[room_ids]

  unless room_that_has_guest.guests_array[index_of_guest].guest_tab.tab_amount > 0
    @rooms[room_ids].take_guest_out_of_room(customer_name)
    puts "#{customer_name} has been checked-out"
    gets.chomp
  else
    puts"DANGER! Please ensure #{customer_name} has paid his tab"
    gets.chomp
  end
end
#Correctly checks guests in to a room
def check_guest_in_to_room(input)
  puts "Please enter name of Guest"
  customer_name = gets.chomp
  guest = Guest.new(customer_name, Tab.new)
  puts @rooms[input-1].put_guest_in_room(guest)
  gets.chomp
  room_selection_menu()
end
  #can correctly view guests in rooms.
  def view_guest_menu
    puts %x{clear}
    puts "Please select a room to view add a guest to"
    room_id = 0
    @rooms.each {|room| puts "#{room_id += 1}. View Guests in room #{room_id}"}
    puts "9. RETURN TO MAIN-MENU"

    input = gets.chomp.to_i
    view_guests_in_room_menu(input) if (input <= 5)
    menu_selection() if input == 9
    view_guest_menu()
  end

  def view_guests_in_room_menu(room_number)
    puts "In room #{room_number} we have #{@rooms[room_number-1].guests_array.length} guest(s)"
    @rooms[room_number-1].check_who_is_in_a_room 
    gets.chomp
    view_guest_menu
  end

  def add_song_to_room_menu(input)
    puts "Enter name of customer to bill song request to."
    guest_name_to_find = gets.chomp
    index_of_guest = @rooms[input-1].find_index_of_someone_in_room(guest_name_to_find)
    song = Song.new("A song")
    guest = @rooms[input-1].guests_array[index_of_guest]
    @rooms[input-1].add_song_to_room(guest,song)
    puts "song added and billed to #{guest.guest_name}, their tab is now £#{guest.guest_tab.tab_amount}"
    gets.chomp
    
  end
  @menu = Menu.new
  @menu.menu_selection
end