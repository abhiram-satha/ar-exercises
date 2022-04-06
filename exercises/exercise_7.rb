require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3,
  too_short: "%{count} characters too short"
  }
  validates :annual_revenue, numericality: true
  validates :annual_revenue, numericality: {
    greater_than_or_equal_to: 0
  }
end



class Employee < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: {
    less_than_or_equal_to: 200
  }
  validates :hourly_rate, numericality: {
    greater_than_or_equal_to: 40 
  }
  validates :store_id, presence: true
end

store_name = gets.chomp

new_store = Store.create(name: "#{store_name}")
puts "Error message #{new_store.errors.full_messages}"