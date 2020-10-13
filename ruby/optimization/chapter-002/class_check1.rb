require 'benchmark'

obj = 'sample string'
time = Benchmark.realtime do
  100_000.times do
    obj.class == String
  end
end

puts time
