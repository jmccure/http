require 'httparty'

World(FruitHelpers)

When(/^the client requests GET (.*)$/) do |path|
  puts Fruit.all
  @last_response = fruit_app_get (path)
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(@last_response.body).should eq(JSON.parse(json))
end


When(/^the client adds fruit via POST (.*):$/) do |path, fruits|
  puts fruits.hashes.to_json
  HTTParty.post('http://localhost:9999' + path, :body => fruits.hashes.to_json,
                                                :headers => {'Content-Type' => 'application/json'})
end


Then(/^the response JSON from GET (.*):$/) do |path, json|
  @last_response = fruit_app_get (path)
  JSON.parse(@last_response.body).should eq(JSON.parse(json))
end

