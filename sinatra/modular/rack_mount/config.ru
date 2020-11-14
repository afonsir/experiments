require 'sinatra/base'
require 'rack/mount'

class Foo < Sinatra::Base
  get('/foo') { 'foo' }
end

class Bar < Sinatra::Base
  get('/bar') { 'bar' }
end

class Get < Sinatra::Base
  get('/') { 'GET!' }
end

class Post < Sinatra::Base
  get('/') { 'POST!' }
end

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route Get,  path_info: %r{^/$},   request_method: 'GET'
  set.add_route Post, path_info: %r{^/$},   request_method: 'POST'
  set.add_route Foo,  path_info: %r{^/foo$}
  set.add_route Bar,  path_info: %r{^/bar$}
end

run Routes
