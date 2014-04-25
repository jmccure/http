Given(/^the system knows about the following fruit:$/) do |table|
  FruitApp.data = fruits.hashes
end
