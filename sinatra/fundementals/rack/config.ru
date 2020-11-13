MyApp = proc do |env|
  [200, { 'Content-Type' => 'text/plain' }, ['ok']]
end

class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/'
      @app.call
    else
      [404, { 'Content-Type' => 'text/plain' }, ['not ok']]
    end
  end
end

use MyMiddleware
run MyApp
# rackup --port 4567 --server thin
