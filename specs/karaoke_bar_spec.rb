require('minitest/autorun')
require('minitest/rg')

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')


class TestKaraokeBar < MiniTest::Test

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

    @rooms = [ @room1, @room2, @room3, @room4 ]

    # guests

    @guest1 = Guest.new("Peter", "McCready", 26, 80.00, "Fuel", "Beer")
    @guest2 = Guest.new("Alan", "Docherty", 28, 70.00, "Sweet Caroline", "Vodka")
    @guest3 = Guest.new("David", "Thorburn", 27, 5.00, "Bohemian Rapsody", "Cider")

    @guests = [ @guest1, @guest2, @guest3 ]

    # bar

    @bar = Bar.new("Spoonman's", @rooms)

  end


  # getters

  def test_name()
    assert_equal("Spoonman's", @bar.name())
  end

  def test_rooms()
    assert_equal(@rooms, @bar.rooms())
  end

  # setters


  # behaviour

  def test_request_entry_fee()
    @bar.request_entry_fee(@guests, @room1)

    assert_equal(true, @guest1.paid_entry?)
    assert_equal(true, @guest2.paid_entry?)
    assert_equal(false, @guest3.paid_entry?)
  end

  def test_can_check_in()
    @bar.request_entry_fee([@guest1], @room1)
    @bar.check_in([@guest1], @room1)

    expected = [@guest1]
    actual = @room1.checked_in()

    assert_equal(expected, actual)
  end

  def test_can_check_in__multiple()
    @bar.request_entry_fee(@guests, @room1)
    @bar.check_in(@guests, @room1)

    expected = [@guest1, @guest2]
    actual = @room1.checked_in()

    assert_equal(expected, actual)
  end

  def test_can_check_out()
    @bar.request_entry_fee(@guests, @room1)
    @bar.check_in(@guests, @room1)
    @bar.check_out([@guest2], @room1)

    expected = [@guest1]
    actual = @room1.checked_in()

    assert_equal(expected, actual)
  end

  def test_can_check_out__multiple()
    @bar.request_entry_fee(@guests, @room1)
    @bar.check_in(@guests, @room1)
    @bar.check_out([@guest2], @room1)

    expected = [@guest1]
    actual = @room1.checked_in()

    assert_equal(expected, actual)
  end


end
