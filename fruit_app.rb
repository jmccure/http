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


    @aaa = @current_fruits_hash << @new_fruit[0]

  #  @aaa = @current_fruits_hash.merge(@new_fruit)



   # @new_fruit_name =
   # @new_fruit_colour =



    File.open('fruitsNEW.json', 'w') do |io|
      io.write(@aaa.to_json)

    end

    #File.open('fruitsOLD.json', 'w') do |io|
    #  io.write(JSON.parse @current_fruits)

    #end

  end
end