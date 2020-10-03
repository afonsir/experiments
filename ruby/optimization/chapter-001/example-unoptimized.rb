require "benchmark"

num_rows = 100000
num_cols = 10

data = Array.new(num_rows) { Array.new(num_cols) { "x"*1000 } }

# puts "%d MB" % (`ps -o rss= -p #{Process.pid}`.to_i / 1024)

# GC.disable # 0.73s

time = Benchmark.realtime do
  csv = data.map { |row| row.join(",") }.join("\n") # 1.27s
end

# puts "%d MB" % (`ps -o rss= -p #{Process.pid}`.to_i / 1024)
puts time.round(2)
