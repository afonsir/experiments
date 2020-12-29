class Movie
  CHILDRENS   = 2
  NEW_RELEASE = 1
  REGULAR     = 0

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end
end
