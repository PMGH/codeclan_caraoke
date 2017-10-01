require('minitest/autorun')
require('minitest/rg')

require_relative('../guest')
require_relative('../song')


class TestSong < MiniTest::Test

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

    @guest = Guest.new("Peter", "McCready", 26, 80, "Fuel", "Beer")
    @guest = Guest.new("Liam", "Adler", 28, 100, "Sweet Caroline", "Gin")

  end


  # getters

  def test_song_artist()
    assert_equal("Audioslave", @song1.artist())
    assert_equal("Slipknot", @song5.artist())
    assert_equal("Paolo Nutini", @song11.artist())
    assert_equal("Neil Diamond", @song16.artist())
    assert_equal("Rick Astley", @song20.artist())
  end

  def test_song_album()
    assert_equal("Audioslave", @song1.album())
    assert_equal("Vol. 3: The Subliminal Verses", @song5.album())
    assert_equal("Caustic Love", @song11.album())
    assert_equal("Sweet Caroline", @song16.album())
    assert_equal("Whenever You Need Somebody", @song20.album())
  end

  def test_song_title()
    assert_equal("Cochise", @song1.title())
    assert_equal("Duality", @song5.title())
    assert_equal("Iron Sky", @song11.title())
    assert_equal("Sweet Caroline", @song16.title())
    assert_equal("Never Gonna Give You Up", @song20.title())
  end

  def test_song_genre()
    assert_equal("Rock", @song1.genre())
    assert_equal("Rock", @song5.genre())
    assert_equal("Mixed", @song11.genre())
    assert_equal("Classic", @song16.genre())
    assert_equal("Classic", @song20.genre())
  end

  # def test_song_rating()
  #   assert_equal(0, @song1.rating())
  #   @guest1.rate_song(@song1, 4)
  #   assert_equal(4, @song1.rating())
  #
  #   @guest1.rate_song(@song3, 5)
  #   @guest2.rate_song(@song3, 3)
  #   assert_equal(4, @song3.rating())
  # end

end
