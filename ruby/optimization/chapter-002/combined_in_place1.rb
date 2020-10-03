require 'wrapper'

data = Array.new(100) { "x" * 1024 * 1024 }

measure do
  data.map { |str| str.upcase }
end

# ruby -I . combined_in_place1.rb
# {"2.7.0":{"gc":"enabled","time":0.1,"gc_count":4,"memory":"101 MB"}}
