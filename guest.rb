class Guest
  attr_reader :guest_name
  def initialize(guest_name, guest_cash)
    @guest_name = guest_name
    @guest_cash = guest_cash
  end
end