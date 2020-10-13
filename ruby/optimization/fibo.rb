require 'benchmark'

def fib(nth)
  return if nth.negative?

  seq = [0, 1]

  (1...nth).each { |i| seq << seq[i - 1] + seq[i] }

  seq[nth]
end

def r_fib(nth)
  return 1 if [0, 1].include? nth

  r_fib(nth - 1) + r_fib(nth - 2)
end

memory_before = `ps -o rss= -p #{Process.pid}`.to_i / 1024

time = Benchmark.realtime do
  puts r_fib(35)
end

memory_after = `ps -o rss= -p #{Process.pid}`.to_i / 1024

puts memory_after - memory_before
puts time.round(2)
