class Person
  attr_writer :department

  def manager
    @department.manager
  end
end
