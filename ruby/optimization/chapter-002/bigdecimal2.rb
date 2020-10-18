require 'bigdecimal'
require 'benchmark'

x = BigDecimal('10.2')
time = Benchmark.realtime do
  10_000.times do
    x.to_s == '10.2' # Just for versions before 2.0
  end
end

puts time
