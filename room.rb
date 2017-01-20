class Room

  def initialize
    @capacity = Array.new
    #going to come back to this, may have all index = empty and update with guest name when checking in and change to empty when checking out, will need to refactor tests and functions to take in to account this change.
    #@capacity = Array.new(8){|i| i = "empty"}

  end

  def capacity
    return @capacity.length
  end

  def put_guest_in_room(guest)
    @capacity.push(guest)
  end

  def take_guest_out_of_room(guest)
      @capacity.delete_if { |person| person.guest_name == guest.guest_name }
  end

end