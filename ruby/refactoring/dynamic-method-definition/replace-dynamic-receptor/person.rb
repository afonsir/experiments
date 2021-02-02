class Person
  attr_accessor :name, :age

  def method_missing(sym, *args, &block)
    empty?(sym.to_s.sub(/^empty_/, '').chomp('?'))
  end

  def empty?(sym)
    send(sym).nil?
  end
end
