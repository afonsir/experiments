GC.disable
before = ObjectSpace.count_objects

Array.new(10_000).each do |i|
  [0, 1].each do |j|
  end
end

after = ObjectSpace.count_objects

puts "# of arrays: %d" % (after[:T_ARRAY] - before[:T_ARRAY])
puts "# of memos: %d" % (after[:T_IMEMO] - before[:T_IMEMO])
