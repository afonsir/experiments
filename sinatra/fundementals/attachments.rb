require 'sinatra'

before do
  content_type :txt
end

get '/attachment' do
  attachment 'name_your_attachment.txt'
  message = ''
  message << "Here's what will be sent downstream, in an attachment"
  message << " called 'name_your_attachment.txt'."
end
