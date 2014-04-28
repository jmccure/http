require 'mongo_mapper'

class Fruit
  include MongoMapper::Document

  MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
  MongoMapper.database = "fruitdb"

  key :name, String
  key :colour, String

end