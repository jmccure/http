require 'httparty'

When(/^the client requests GET (.*)$/) do |path|
  @last_response = HTTParty.get('http://localhost:9999' + path)
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(@last_response.body).should eq(JSON.parse(json))
end





When(/^the client adds a fruit via POST (.*):$/) do |path, fruits|
  #HTTParty.post('http://localhost:9999' + path,
  #              :body => {:name => 'test', :colour => 'pink'}.to_json,
  #              :headers => {'Content-Type' => 'application/json'})

  HTTParty.post('http://localhost:9999' + path, :body => fruits.hashes.to_json, :headers => {'Content-Type' => 'application/json'})

  puts fruits.hashes.to_json
  puts JSON.parse fruits.hashes.to_json

end


Then(/^the response JSON from GET \/fruits$/) do |string|
    pending # express the regexp above with the code you wish you had
end