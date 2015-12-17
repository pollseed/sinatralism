require 'sinatra'

get '/' do
    'Hello, World!'
end

post '/' do
    'Howdy'
end

get '/hello/:name' do
    "Hello, #{params['name']}!"
end

get '/hello2/:name' do |n|
    "Howdy, #{n}!"
end
