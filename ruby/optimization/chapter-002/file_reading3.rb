require 'csv'
require 'wrapper'

measure do
  CSV.read("data.csv")
end

# ruby -I . file_reading3.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.36,"gc_count":0,"memory":"48 MB"}}