Given(/^the system knows about the following fruit:$/) do |fruits|
  File.open('fruits.json', 'w') do |io|
    io.write(fruits.hashes.to_json)
  end

  test = Fruit.new(:name => 'Ggggg', :colour => 'Yellow')


  #FruitApp.data = fruits.hashes
end
