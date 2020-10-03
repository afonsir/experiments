require "wrapper"

str = "X" * 1024 * 1024 * 10  # 10 MB string

measure do
  str = str.downcase
end

measure do
  str.downcase!
end

# ruby -I . string-in-place-1.rb --no-gc
# {"2.7.0":{"gc":"disabled","time":0.01,"gc_count":0,"memory":"10 MB"}}
# {"2.7.0":{"gc":"disabled","time":0.1,"gc_count":0,"memory":"0 MB"}}