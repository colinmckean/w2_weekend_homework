class Guest

  #when adding guest to room or booking rom it should add to tab amount.
  attr_reader :guest_name, :guest_tab
  def initialize(guest_name, tab)
    @guest_name = guest_name
    @guest_tab = tab
    @guest_credit_limit = 100
  end
end