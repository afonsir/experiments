require 'csv'
require 'wrapper'

measure do
  file = CSV.open("data.csv")

  while line = file.readline
  end
end

# ruby -I . file_reading5.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.39,"gc_count":0,"memory":"49 MB"}}
#
# ruby -I . file_reading5.rb
# {"2.7.0":{"gc":"enabled","time":0.39,"gc_count":112,"memory":"1 MB"}}