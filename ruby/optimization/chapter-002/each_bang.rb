class Thing; end
list = Array.new(1000) { Thing.new }
puts ObjectSpace.each_object(Thing).count # 1000 objects

# list.each do |item|
#   GC.start
#   puts ObjectSpace.each_object(Thing).count # 1000 (same count as before)
#   # do something with the item
# end

while list.count.positive?
  GC.start # this will garbage collect item from previous iteration
  puts ObjectSpace.each_object(Thing).count # watch the counter decreasing
  item = list.shift
  # do something with the item
end

GC.start
puts ObjectSpace.each_object(Thing).count # 0 (everything has been deallocated)
