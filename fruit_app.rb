require 'sinatra'
require 'json'

class FruitApp < Sinatra::Base
  set :data do
    JSON.parse(File.read('fruits.json'))
  end

  get '/fruits' do
    content_type :json
    FruitApp.data.to_json
  end

  post '/add_fruit' do
    request.body.rewind
    @current_fruits_hash = FruitApp.data
    @new_fruit = JSON.parse request.body.read

    @new_fruit.each do |fruit|
      @current_fruits_hash << fruit
    end

    File.open('fruits.json', 'w') do |io|
      io.write(@current_fruits_hash.to_json)
    end

  end
end