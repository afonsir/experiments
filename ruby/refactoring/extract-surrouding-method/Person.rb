class Person
  attr_reader :mother, :children, :name

  def initialize(name, date_of_birth, date_of_death = nil, mother = nil)
    @name = name
    @mother = mother
    @date_of_birth = date_of_birth
    @date_of_death = date_of_death
    @children = []
    @mother&.add_child(self)
  end

  def add_child(child)
    @children << child
  end

  def number_of_living_decendants
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count + child.number_of_living_decendants
    end
  end

  def number_of_decendants_named(name)
    children.inject(0) do |count, child|
      count += 1 if child.name == name
      count + child.number_of_decendants_named(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end
