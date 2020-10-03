require 'wrapper'

measure do
  file = File.open("data.csv", "r")

  while line = file.gets
    line.split(",")
  end
end

# ruby -I . file_reading4.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.07,"gc_count":0,"memory":"31 MB"}}
#
# ruby -I . file_reading4.rb
# {"2.7.0":{"gc":"enabled","time":0.07,"gc_count":51,"memory":"0 MB"}}