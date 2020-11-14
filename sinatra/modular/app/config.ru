require 'sinatra/base'

Dir.glob('./helpers/*.rb').sort.each { |file| require file }
Dir.glob('./controllers/*.rb').sort.each { |file| require file }

map('/example') { run ExampleController }
map('/') { run ApplicationController }
