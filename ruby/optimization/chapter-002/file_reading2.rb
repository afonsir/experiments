require 'wrapper'

measure do
  File.readlines("data.csv").map! { |line| line.split(",") }
end

# ruby -I . file_reading2.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.07,"gc_count":0,"memory":"32 MB"}}