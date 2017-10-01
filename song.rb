class Song

  # initialize
  def initialize(artist, album, title, genre)
    @artist = artist
    @album = album
    @title = title
    @genre = genre

    # Additional
    # @ratings = []
    # @rating = @ratings.length() > 0 ? (@ratings.sum()) / (@ratings.length()) : 0 # between 1 and 5
  end


  # getters

  def artist()
    return @artist
  end

  def album()
    return @album
  end

  def title()
    return @title
  end

  def genre()
    return @genre
  end


  # setters


  # behaviour



end
