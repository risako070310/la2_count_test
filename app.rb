require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 0
    Count.create(number: 0)
  end
end

get '/' do
  @number = Count.first.number
  erb :index
end

post '/plus' do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect "/"
end

post '/minus' do
  count = Count.first
  if count.number > 0
    count.number = count.number - 1
    count.save
  end
  redirect "/"
end

post '/reset' do
  count = Count.first
  count.number = 0
  count.save
  redirect "/"
end

post '/kakeru2' do
  count = Count.first
  count.number = count.number * 2
  count.save
  redirect "/"
end

post '/waru2' do
  count = Count.first
  count.number = count.number / 2
  count.save
  redirect "/"
end