class Bar

  # initialize
  def initialize(name, rooms)
    @name = name
    @rooms = rooms
  end


  # getters

  def name()
    return @name
  end

  def rooms()
    return @rooms
  end


  # setters


  # behaviour

  # request entry fee
  def request_entry_fee(guests, room)
    # for each guest in the guests array pay the entry_fee for the room
    # pay_entry_fee method checks if they can afford it
    guests.each { |guest| guest.pay_entry_fee(room.entry_fee()) }
  end

  # check in guest/s
  def check_in(guests, room)
    room.check_in_guests(guests)
  end


  # check out guest/s
  def check_out(guests, room)
    room.check_out_guests(guests)
  end


end
