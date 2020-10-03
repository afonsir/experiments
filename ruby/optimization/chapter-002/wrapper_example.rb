require 'csv'
require 'wrapper'

measure do
  data = CSV.open("data.csv")

  output = data.readlines.map do |line|
    line.map { |col| col.downcase.gsub(/\b('?[a-z])/) { $1.capitalize } }
  end

  File.open("output.csv", "w+") { |f| f.write output.join("\n") }
end

# ruby -I . wrapper-example.rb
# {"2.7.0":{"gc":"enabled","time":1.79,"gc_count":40,"memory":"86 MB"}}
#
# ruby -I . wrapper-example.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":1.52,"gc_count":0,"memory":"327 MB"}}