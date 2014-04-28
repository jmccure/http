module FruitHelpers
  def fruit_app_get (path)
    HTTParty.get('http://localhost:9999' + path)
  end
end