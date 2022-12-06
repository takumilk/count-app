require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  'My name is Yamato'
end

get '/count' do
  @number =Count.find(1).number 
  erb :index
end

post '/plus' do
  count = Count.find(1)
  count.number = count.number + 1
  count.save
  redirect '/count'
end

post '/minus' do
  count =Count.find(1)
  count.number = count.number + (-1)
  count.save
  redirect '/count'
end

post '/times2' do
  count =Count.find(1)
  count.number = count.number*2 
  count.save
  redirect '/count'
end

post '/divide2' do
  count =Count.find(1)
  count.number = count.number/2 
  count.save
  redirect '/count'
end