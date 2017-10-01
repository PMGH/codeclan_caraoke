require('minitest/autorun')
require('minitest/rg')

require_relative('../drink')


class TestDrink < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Jaeger Bomb", 2.00)
    @drink2 = Drink.new("Corona", 2.50)
    @drink3 = Drink.new("Zombie", 4.50)
    @drink4 = Drink.new("Tequila", 1.50)
    @drink5 = Drink.new("Sambuca", 1.50)
  end


  def test_name()
    assert_equal("Corona", @drink2.name())
  end

  def test_price()
    assert_equal(2.00, @drink1.price())
  end

end
