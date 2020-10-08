class Array
  def each!
    while count.positive?
      yield(shift)
    end
  end
end

class Thing; end

list = Array.new(1000) { Thing.new }

list.each! do |element|
  GC.start # this will garbage collect item from previous iteration
  puts ObjectSpace.each_object(Thing).count # watch the counter decreasing
  puts element.class
end

GC.start
puts ObjectSpace.each_object(Thing).count # 0 (everything has been deallocated)
