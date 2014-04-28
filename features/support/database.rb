require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
MongoMapper.database = "fruitdb"

Before do
  DatabaseCleaner.clean
end