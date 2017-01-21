class Tab
  attr_reader :tab_amount
  def initialize
    @tab_amount = 0
  end

  def put_on_tab(amount)
    @tab_amount += amount
  end

  def take_payment(amount)
    @tab_amount -= amount
  end


end