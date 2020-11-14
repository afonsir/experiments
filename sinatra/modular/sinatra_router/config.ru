require 'sinatra/base'

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

class Routes < Sinatra::Base
  get('/')    { Get.call(env) }
  post('/')   { Post.call(env) }
  get('/foo') { Foo.call(env) }
  get('/bar') { Bar.call(env) }
end

run Routes
