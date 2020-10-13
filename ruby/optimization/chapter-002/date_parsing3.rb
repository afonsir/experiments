require 'benchmark'
require 'date'

date = '2014-05-23'
time = Benchmark.realtime do
  10_000.times do
    Date.civil(date[0, 4].to_i, date[5, 2].to_i, date[8, 2].to_i)
  end
end

puts '%.3f' % time # 0.010
