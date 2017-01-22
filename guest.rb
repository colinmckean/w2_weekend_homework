class Guest

  #when adding guest to room or booking rom it should add to tab amount.
  attr_reader :guest_name, :guest_tab
  def initialize(guest_name, tab)
    @guest_name = guest_name
    @guest_tab = tab
    @guest_credit_limit = 100
  end

  def charge_to_tab(amount)
    unless guest_tab.tab_amount + amount > @guest_credit_limit
    @guest_tab.put_on_tab(amount)
    end
    return guest_tab.tab_amount
  end
end