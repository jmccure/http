Given(/^the system knows about the following fruit:$/) do |fruits|
  fruits.hashes.each do |fruit|
    @new_fruit = Fruit.new(fruit)
    @new_fruit.save!
  end
end
