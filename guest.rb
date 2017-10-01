require('pry-byebug')
require_relative('song')


class Guest

  # initialize
  def initialize(first_name, last_name, age, cash, favourite_song, favourite_drink)
    @first_name = first_name
    @last_name = last_name
    @age = age  # additional: check if over18?
    @cash = cash
    @entry_paid = false
    @favourite_song = favourite_song
    @favourite_drink = favourite_drink
    @drinks = []
    @tab_total = 0.00
    @bar_tab_paid = true
  end


  # getters

  def name()
    return "#{@first_name} #{@last_name}"
  end

  def age()
    return @age
  end

  def cash()
    return @cash
  end

  def paid_entry?()
    return @entry_paid
  end

  def favourite_song()
    return @favourite_song
  end

  def favourite_drink()
    return @favourite_drink
  end

  def drinks()
    return @drinks
  end

  def tab_total()
    return @tab_total
  end

  def bar_tab_paid?()
    return @bar_tab_paid
  end


  # setters
  def add_to_tab_total(drink)
    # increment tab_total by the drink price
    @tab_total += drink.price()
  end

  # behaviour

  # required before check_in complete
  def pay_entry_fee(entry_fee)
    # if the guest has enough cash for entry_fee
    if @cash >= entry_fee
      # decrement guest cash by entry_fee
      @cash -= entry_fee
      # update guest entry_paid to true
      update_entry_paid()
    end
  end

  def update_entry_paid()
    @entry_paid = true
  end

  def add_drink_to_tab(drink)
    # add to Room bar_tab
    if @cash >= (@tab_total + drink.price())
      # add drink to Guest drinks
      @drinks << drink
      # add to tab total
      add_to_tab_total(drink)
      # Guest bar tab needs paid
      @bar_tab_paid = false
    else
      return "Sorry, you can't afford that drink."
    end
  end

  def pay_bar_tab()
    # decrement Guest cash by tab_total
    @cash -= @tab_total
    # clear drinks array
    @drinks.clear
    # Guest bar tab paid
    @bar_tab_paid = true
  end


end
