require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../song')
require_relative('../drink')


class TestGuest < MiniTest::Test

  def setup()

    # songs

    @song1 = Song.new("Audioslave", "Audioslave", "Cochise", "Rock")
    @song2 = Song.new("Soundgarden", "Superunknown", "Spoonman", "Rock")
    @song3 = Song.new("Metallica", "Reload", "Fuel", "rock")
    @song4 = Song.new("Pantera", "Cowboys From Hell", "Cowboys From Hell", "Rock")
    @song5 = Song.new("Slipknot", "Vol. 3: The Subliminal Verses", "Duality", "Rock")

    @song6 = Song.new("Deadmau5", "I Remember", "I Remember", "Dance")
    @song7 = Song.new("Zhu", "Faded", "Faded", "Dance")
    @song8 = Song.new("Tove Lo", "Queen Of The Clouds", "Stay High", "Dance")
    @song9 = Song.new("Roger Sanchez", "Renaissance The Classics", "Another Chance", "Dance")
    @song10 = Song.new("Eric Prydz", "Call On Me", "Call On Me", "Dance")

    @song11 = Song.new("Paolo Nutini", "Caustic Love", "Iron Sky", "Mixed")
    @song12 = Song.new("The Naked And Famous", "Passive Me, Aggressive You", "Young Blood", "Mixed")
    @song13 = Song.new("Foals", "What Went Down", "Mountain At My Gates", "Mixed")
    @song14 = Song.new("M83", "Saturdays = Youth", "We Own The Sky", "Mixed")
    @song15 = Song.new("Gorillaz", "Gorillaz", "Clint Eastwood", "Mixed")

    @song16 = Song.new("Neil Diamond", "Sweet Caroline", "Sweet Caroline", "Classic")
    @song17 = Song.new("Journey", "Escape", "Don't Stop Believin'", "Classic")
    @song18 = Song.new("Queen", "A Night at the Opera", "Bohemian Rapsody", "Classic")
    @song19 = Song.new("The Mamas and the Papas", "If You Can Believe Your Eyes And Ears", "California Dreamin'", "Classic")
    @song20 = Song.new("Rick Astley", "Whenever You Need Somebody", "Never Gonna Give You Up", "Classic")

    # guests

    @guest1 = Guest.new("Peter", "McCready", 26, 80.00, @song1, "Beer")
    @guest2 = Guest.new("Liam", "Adler", 28, 100.00, @song16, "Gin")
    @guest3 = Guest.new("Jamie", "Chair", 17, 5.00, @song10, "Vodka")
    @guest4 = Guest.new("Julia", "Brown", 25, 70.00, @song11, "Vodka")
    @guest5 = Guest.new("Emma", "Rodriguez", 26, 80.00, @song20, "Vodka")

    # drinks

    @drink1 = Drink.new("Jaeger Bomb", 2.00)
    @drink2 = Drink.new("Corona", 2.50)
    @drink3 = Drink.new("Zombie", 4.50)
    @drink4 = Drink.new("Tequila", 1.50)
    @drink5 = Drink.new("Sambuca", 1.50)

    @drinks = [ @drink1, @drink2, @drink3, @drink4, @drink5 ]

  end


  # getters

  def test_name()
    assert_equal("Peter McCready", @guest1.name())
    assert_equal("Jamie Chair", @guest3.name())
    assert_equal("Julia Brown", @guest4.name())
  end

  def test_age()
    assert_equal(26, @guest1.age())
    assert_equal(17, @guest3.age())
    assert_equal(25, @guest4.age())
  end

  def test_cash()
    assert_equal(80.00, @guest1.cash())
    assert_equal(5.00, @guest3.cash())
    assert_equal(70.00, @guest4.cash())
  end

  def test_paid_entry?()
    assert_equal(false, @guest1.paid_entry?())
  end

  def test_favourite_song()
    assert_equal(@song1, @guest1.favourite_song())
    assert_equal(@song10, @guest3.favourite_song())
    assert_equal(@song11, @guest4.favourite_song())
  end

  def test_favourite_drink()
    assert_equal("Beer", @guest1.favourite_drink())
    assert_equal("Vodka", @guest3.favourite_drink())
    assert_equal("Vodka", @guest4.favourite_drink())
  end

  def test_drinks()
    assert_equal([], @guest1.drinks())
  end

  def test_tab_total()
    assert_equal(0.00, @guest1.tab_total())
  end

  def test_bar_tab_paid?()
    assert_equal(true, @guest1.bar_tab_paid?())
  end

  # setters

  def test_add_to_tab_total()
    @guest1.add_to_tab_total(@drink1)

    assert_equal(2.00, @guest1.tab_total())
  end

  # behaviour

  def test_can_pay_entry_fee__can_afford()
    @guest1.pay_entry_fee(10.00)

    assert_equal(70.00, @guest1.cash())

    @guest1.pay_entry_fee(15.00)

    assert_equal(55.00, @guest1.cash())
  end

  def test_can_pay_entry_fee__cannot_afford()
    expected = false

    @guest3.pay_entry_fee(10.00)

    assert_equal(expected, @guest3.paid_entry?())
  end

  def test_can_pay_entry_fee()
    assert_equal(false, @guest1.paid_entry?)

    @guest1.pay_entry_fee(10)
    assert_equal(true, @guest1.paid_entry?)
  end

  def test_can_add_drink_to_tab()
    @guest1.add_drink_to_tab(@drink1)
    @guest1.add_drink_to_tab(@drink3)

    assert_equal([@drink1, @drink3], @guest1.drinks())
  end

  def test_can_pay_bar_tab()
    @guest1.add_drink_to_tab(@drink1)
    @guest1.add_drink_to_tab(@drink3)

    @guest1.pay_bar_tab()

    assert_equal(true, @guest1.bar_tab_paid?())
    assert_equal([], @guest1.drinks())
  end


end
