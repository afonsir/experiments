require './cascade'

run Rack::Cascade.new [Foo1, Foo2]
# rackup --server thin --port 4567
