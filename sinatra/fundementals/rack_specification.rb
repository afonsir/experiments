module MySinatra
  class Application

    def self.call(env)
      new.call(env)
    end

    def call(env)
      headers = { 'Content-Type': 'text/html' }
      if env['PATH_INFO'] == '/'
        status = 200
        body = 'hi'
      else
        status = 404
        body = "Sinatra doesn't know this ditty!"
      end
      headers['Content-Lenght'] = body.length.to_s
      [status, headers, [body]]
    end
  end
end

require 'thin'
Thin::Server.start MySinatra::Application, 4567
