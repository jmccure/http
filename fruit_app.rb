require 'sinatra'
require 'json'
require File.join(File.dirname(__FILE__), 'lib', 'fruit')


class FruitApp < Sinatra::Base


  set :data do
    Fruit.all
  end

  get '/fruits' do
    content_type :json
    FruitApp.data.to_json
  end

  post '/add_fruit' do

     request.body.rewind
     @new_fruit = JSON.parse request.body.read

     @new_fruit.each do |fruit|
       @new_fruit = Fruit.new(fruit)
       @new_fruit.save!
     end
  end
end