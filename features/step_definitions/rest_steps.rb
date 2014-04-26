require 'rack'

When(/^the client requests GET (.*)$/) do |path|
  get(path)
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(last_response.body).should eq(JSON.parse(json))
end