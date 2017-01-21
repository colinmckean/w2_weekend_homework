require 'minitest/autorun'
require 'minitest/rg'
require_relative '../Tab'

class TestTab < Minitest::Test
  def setup
    @customer_tab = Tab.new
  end

  def test_tab_amount
    assert_equal(0, @customer_tab.tab_amount)
  end

  def test_put_on_tab
    assert_equal(10, @customer_tab.put_on_tab(10))
    assert_equal(4, @customer_tab.take_payment(6))
  end
end