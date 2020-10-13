require 'benchmark'
require 'date'

date = '2014-05-23'
time = Benchmark.realtime do
  10_000.times do
    Date.strptime(date, '%Y-%m-%d')
  end
end

puts '%.3f' % time # 0.011
