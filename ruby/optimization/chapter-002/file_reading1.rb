require 'wrapper'

measure do
  File.read("data.csv")
end

# ruby -I . file_reading1.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.0,"gc_count":0,"memory":"5 MB"}}