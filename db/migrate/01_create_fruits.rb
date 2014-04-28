class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.name :number
      t.colour :balance
    end
  end
end