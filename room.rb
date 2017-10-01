require('pry-byebug')


class Room

  # initialize
  def initialize(name, capacity, entry_fee, songs)
    @name = name
    @capacity = capacity
    @at_capacity = false
    @entry_fee = entry_fee
    @playlist = songs
    @checked_in = []
    @spaces_available = @capacity
    @drinks = []  # { guest: drinks }
    @bar_tab = 0.00
  end


  # getters

  def name()
    return @name
  end

  def capacity()
    return @capacity
  end

  def entry_fee()
    return @entry_fee
  end

  def playlist()
    return @playlist
  end

  def checked_in()
    return @checked_in
  end

  def spaces_available()
    return @spaces_available
  end

  def drinks()
    return @drinks
  end

  def bar_tab()
    return @bar_tab
  end


  # setters

  def at_capacity?()
    # if the @checked_in array length is equal to Room's @capacity then set @at_capacity to true
    @at_capacity = true if @checked_in.length() == @capacity
    return @at_capacity
  end

  def update_spaces_available()
    @spaces_available = @capacity - @checked_in.length()
  end

  def add_drinks(drinks)
    drinks.each { |drink| @drinks << drink }
  end

  def add_to_bar_tab(drink)
    @bar_tab += drink.price()
  end


  # behaviours

  def check_in_guests(guests)
    # create empty array
    refused_entry = []

    # if there is enough space in the Room
    if guests.length() <= @spaces_available
      # has Guest paid the entry fee? (true/false)
      # if true: check them in
      # if false: refuse entry (add to refused_entry array)
      guests.each { |guest|
        guest.paid_entry?() ? @checked_in << guest : refused_entry << guest
      }
      # update Room number of spaces available
      update_spaces_available()
    else
      return "Check-in error: not enough space."
    end

    # return the refused_entry array
    return refused_entry
  end

  def check_favourite_song()
    # create empty array for responses
    responses = []

    # block to check the favourite song of each guest in Room's @checked_in array
    # adds "Whoo!" to responses if found, or nil if not found
    @checked_in.each { |guest|
      responses << "Whoo!" if @playlist.include?(guest.favourite_song())
    }

    if responses.length == 1
      return responses.join('')
    elsif
      responses.length() > 1
      # return the guest's responses
      return responses.join(' ')
    else
      return nil
    end
  end

  def check_out_guests(guests)
    # block deletes each guest in Guests from Room's @checked_in array
    guests.each { |guest| @checked_in.delete(guest)
    }

    # update Room number of spaces available
    update_spaces_available()
  end

  def add_song(new_song)
    # shovel new_song into Room's @playlist array
    @playlist << new_song
  end


end
