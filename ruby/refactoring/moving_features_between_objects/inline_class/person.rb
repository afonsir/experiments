class Person
  attr_reader :name, :office_telephone

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    @office_telephone.telephone_number
  end
end
