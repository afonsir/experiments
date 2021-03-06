class Movie
  attr_accessor :price
  attr_reader :title

  def initialize(title, price)
    @title = title
    @price = price
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end
