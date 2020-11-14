class ExampleController < ApplicationController
  get '/' do
    title 'Example page'
    erb :example
  end
end
