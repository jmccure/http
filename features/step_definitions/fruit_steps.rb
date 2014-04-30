Given(/^the system knows about the following fruit:$/) do |fruits|
  fruits.hashes.each do |fruit|
    @new_fruit = Fruit.new(fruit)
    @new_fruit.save!
  end
end


Given(/^the system loads fruit from (.*)$/) do |filename|
  fruits = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'test_data', filename << '.yaml'))
  fruits.each do |fruit|
    @new_fruit = Fruit.new(fruit)
    @new_fruit.save!
  end
end