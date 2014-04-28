require 'mongo_mapper'

class Fruit
  include MongoMapper::Document

  key :name, String
  key :colour, String

end