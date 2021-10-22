class Dealership
  attr_reader :name,
              :address,
              :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def add_car(car_instance)
    @inventory << car_instance
  end

  def inventory_count
    @inventory.length
  end

  def cars_by_make(make_of_car)
    @inventory.find_all do |car|
      car.make == make_of_car
    end
  end

  def total_value
    @inventory.sum do |car|
      car.total_cost
    end
  end

  def details
    details_hash ={
      "total_value" => total_value,
      "address" => @address
    }
    details_hash
  end

  def average_price_of_car
    average_price = (total_value / @inventory.length).to_s
    first_two = average_price.slice(0..1)
    last_three = average_price.slice(2..4)

    "#{first_two},#{last_three}"

    ##THIS ALSO WORKS
    # (total_value / @inventory.length).to_s.insert(',', 4)


    ## I FOUND THIS BELOW METHOD ONLINE THAT IS REALLY DYNAMIC. I DO NOT UNDERSTAND IT BUT WOULD LIKE TO LEAVE IT HERE SO I CAN TRY TO UNDERSTAND LATER. THIS IS A HARD METHOD. PLEASE HELP ME UNDERSTAND THIS SOMETIME

    # number_string_format = (total_value / @inventory.length).to_s.chars.reverse.each_slice(3)
    # number_string_format.map(&:join).join(',').reverse


  ##### ALSO THIS WORKS
  #   def average_price_of_car
  #   avg = (total_value / inventory_count).to_s
  #   if avg.length == 4
  #     a = avg.slice(0)
  #     b = avg.slice(1..3)
  #     "#{a},#{b}"
  #   elsif avg.length == 5
  #     a = avg.slice(0..1)
  #     b = avg.slice(2..4)
  #     "#{a},#{b}"
  #   elsif avg.length == 6
  #     a = avg.slice(0..2)
  #     b = avg.slice(3..5)
  #     "#{a},#{b}"
  #   elsif avg.length == 7
  #     a = avg.slice(0)
  #     b = avg.slice(1..3)
  #     c = avg.slice(4..6)
  #     "#{a},#{b},#{c}"
  #   elsif avg.length == 8
  #     a = avg.slice(0..1)
  #     b = avg.slice(2..4)
  #     c = avg.slice(5..7)
  #     "#{a},#{b},#{c}"
  #   elsif avg.length == 9
  #     a = avg.slice(0..2)
  #     b = avg.slice(3..5)
  #     c = avg.slice(6..8)
  #     "#{a},#{b},#{c}"
  #   end
  # end
  end

  def cars_sorted_by_price
    @inventory.sort_by do |car|
      car.total_cost
    end
  end

  def cars_in_categoty(category)
    @inventory.find_all do |car|
      car.make == category
    end
  end

  def inventory_hash
    @inventory.group_by do |car|
      car.make
    end

    # hash_of_cars = {}
    # # keys are make name of cars in string form
    # keys = @inventory.map do |car|
    #   car.make
    # end
    #
    # keys.each do |key|
    #   hash_of_cars[key] = cars_in_categoty(key)
    # end
    # hash_of_cars
  end

end
