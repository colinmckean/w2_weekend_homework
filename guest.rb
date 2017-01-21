class Guest
  attr_reader :guest_name
  def initialize(guest_name)
    @guest_name = guest_name
    @guest_cash = 0
  end
end