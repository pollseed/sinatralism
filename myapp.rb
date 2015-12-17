require 'sinatra'
require 'sinatra/reloader' if development?

set :public_folder, File.dirname(__FILE__) + '/public'

helpers do
  def now
    Time.now
  end
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end

  def default(title, content)
    @title = title
    @content = content
  end
end

before do
  cache_control :public, :max_age => 0
end

get '/' do
  Stream.new.default('hoge', "hogehogeTODO")
end


get '/:title' do
  Stream.new.default(params['title'], "hogehogeTODO")
end

post ('/') { Stream.new }

get '/hello/:name' do
  "Hello, #{params['name']}!"
end

get '/hello2/:name' do |n|
  "Howdy, #{n}!"
end

get '/now' do
  erb "<%= now() %>"
end
