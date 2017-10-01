require('minitest/autorun')
require('minitest/rg')

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')


class TestRoom < MiniTest::Test

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

    # playlists

    @rock_playlist = [ @song1, @song2, @song3, @song4, @song5 ]
    @dance_playlist = [ @song6, @song7, @song8, @song9, @song10 ]
    @mixed_playlist = [ @song11, @song12, @song13, @song14, @song15 ]
    @classic_playlist = [ @song16, @song17, @song18, @song19, @song20 ]

    # rooms

    @room1 = Room.new("Rock Am Room", 3, 7.50, @rock_playlist)
    @room2 = Room.new("Dance Hall", 25, 9.00, @dance_playlist)
    @room3 = Room.new("The Bakery", 15, 8.00, @mixed_playlist)
    @room4 = Room.new("Old But Gold", 25, 7.50, @classic_playlist)

    # drinks

    @drink1 = Drink.new("Jaeger Bomb", 2.00)
    @drink2 = Drink.new("Corona", 2.50)
    @drink3 = Drink.new("Zombie", 4.50)
    @drink4 = Drink.new("Tequila", 1.50)
    @drink5 = Drink.new("Sambuca", 1.50)

    @drinks = [ @drink1, @drink2, @drink3, @drink4, @drink5 ]

    # guests

    @guest1 = Guest.new("Peter", "McCready", 26, 80.00, @song2, "Beer")
    @guest2 = Guest.new("Alan", "Docherty", 28, 70.00, @song16, "Vodka")
    @guest3 = Guest.new("David", "Thorburn", 27, 5.00, @song18, "Cider")
    @guest4 = Guest.new("Steph", "Allen", 27, 30.00, @song14, "Wine")

    @guests = [ @guest1, @guest2, @guest3 ]

  end


  # getters

  def test_name()
    assert_equal("Rock Am Room", @room1.name())
    assert_equal("Dance Hall", @room2.name())
    assert_equal("The Bakery", @room3.name())
    assert_equal("Old But Gold", @room4.name())
  end

  def test_capacity()
    assert_equal(3, @room1.capacity())
    assert_equal(25, @room2.capacity())
    assert_equal(15, @room3.capacity())
    assert_equal(25, @room4.capacity())
  end

  def test_entry_fee()
    assert_equal(7.50, @room1.entry_fee())
  end

  def test_playlist()
    assert_equal(@rock_playlist, @room1.playlist())
    assert_equal(@dance_playlist, @room2.playlist())
    assert_equal(@mixed_playlist, @room3.playlist())
    assert_equal(@classic_playlist, @room4.playlist())
  end

  def test_checked_in()
    @guest1.pay_entry_fee(10)
    @guest2.pay_entry_fee(10)

    @room3.check_in_guests(@guests)

    assert_equal([@guest1, @guest2], @room3.checked_in())
    assert_equal([], @room4.checked_in())
  end

  def test_spaces_available()
    assert_equal(3, @room1.spaces_available())
  end

  def test_bar_tab()
    assert_equal(0.00, @room1.bar_tab())
  end


  # setters

  def test_at_capacity__true()
    @guest1.pay_entry_fee(5)
    @guest2.pay_entry_fee(5)
    @guest3.pay_entry_fee(5)
    @room1.check_in_guests(@guests)

    assert_equal(true, @room1.at_capacity?())
  end

  def test_at_capacity__false()
    assert_equal(false, @room1.at_capacity?())
  end

  def test_update_spaces_available()
    @guest1.pay_entry_fee(10)
    @guest2.pay_entry_fee(10)
    @guest3.pay_entry_fee(10)
    @room1.check_in_guests(@guests)

    assert_equal(1, @room1.spaces_available())
  end

  def test_add_drinks()
    @room1.add_drinks(@drinks)

    assert_equal(@drinks, @room1.drinks())
  end

  def test_can_add_to_bar_tab()
    @room1.add_to_bar_tab(@drink1)
    @room1.add_to_bar_tab(@drink2)
    @room1.add_to_bar_tab(@drink3)
    @room1.add_to_bar_tab(@drink4)
    @room1.add_to_bar_tab(@drink5)

    assert_equal(12.00, @room1.bar_tab())
  end


  # behaviours

  def test_check_in_guests__paid_entry()
    @guest1.pay_entry_fee(10)
    @room1.check_in_guests(@guests)

    expected = @guest1.name()
    actual = @room1.checked_in()[0].name()

    assert_equal(expected, actual)
  end

  def test_check_in_guest__not_paid_entry()
    @guest1.pay_entry_fee(10)
    @guest2.pay_entry_fee(10)
    @guest3.pay_entry_fee(10)

    expected = [@guest3]
    actual = @room1.check_in_guests(@guests)

    assert_equal(expected, actual)
  end

  def test_check_in_guests__not_paid_entry()
    expected = [@guest2, @guest3]

    @guest1.pay_entry_fee(80)
    @guest2.pay_entry_fee(80)
    @guest3.pay_entry_fee(80)

    actual = @room1.check_in_guests(@guests)

    assert_equal(expected, actual)
  end

  def test_check_in__not_enough_space()
    @guests = [ @guest1, @guest2, @guest3, @guest4 ]

    @guest1.pay_entry_fee(5)
    @guest2.pay_entry_fee(5)
    @guest3.pay_entry_fee(5)
    @guest4.pay_entry_fee(5)

    expected = "Check-in error: not enough space."
    actual = @room1.check_in_guests(@guests)

    assert_equal(expected, actual)
  end

  def test_check_out_guests()
    @guest1.pay_entry_fee(10)
    @room1.check_in_guests(@guests)

    assert_equal([@guest1], @room1.checked_in())


    @room1.check_out_guests(@guests)

    assert_equal([], @room1.checked_in())
  end

  def test_add_song()
    @room3.add_song(@song20)

    expected = [ @song11, @song12, @song13, @song14, @song15, @song20 ]
    actual = @room3.playlist()

    assert_equal(expected, actual)
  end

  def test_check_favourite_song__favourite()
    @guest1.pay_entry_fee(10)
    @room1.check_in_guests(@guests)

    expected = "Whoo!"
    actual = @room1.check_favourite_song()

    assert_equal(expected, actual)
  end

  def test_check_favourite_song__not_favourite()
    @guest1.pay_entry_fee(10)
    @guest2.pay_entry_fee(10)
    @room3.check_in_guests(@guests)

    expected = nil
    actual = @room3.check_favourite_song()

    assert_equal(expected, actual)
  end

  def test_check_favourite_song__favourite_multiple()
    @guest2.pay_entry_fee(5)
    @guest3.pay_entry_fee(5)
    @room4.check_in_guests(@guests)

    expected = "Whoo! Whoo!"
    actual = @room4.check_favourite_song()

    assert_equal(expected, actual)
  end


end
