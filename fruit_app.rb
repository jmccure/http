require 'sinatra'
require 'json'

class FruitApp < Sinatra::Base


  set :data do
    Fruit.all
    #JSON.parse(Fruit.all)
  end

  get '/fruits' do
    content_type :json
    FruitApp.data.to_json
    #db table to json

    #cursor =
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