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
class Employee
  validates :store_id, :first_name, :last_name, presence: true
  validates :hourly_rate, value: { greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
end

class Store
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, value: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :must_carry_mens_apparel, :must_carry_womens_apparel

  def must_carry_mens_apparel
    if !mens_apparel
      errors.add(:mens_apparel, "must carry mens apparel")
    end
  end
 
  def must_carry_womens_apparel
    if !womens_apparel
      errors.add(:womens_apparel, "must carry womens apparel")
    end
  end
end


error1 = Employee.create(first_name: "Perth", last_name: "Combate", hourly_rate: 10)
puts error1.errors.messages

error2 = Store.create(name: "Sobeys", annual_revenue: 1.1, womens_apparel: true)
puts error2.errors.messages

puts "please enter a store name:"
@store_name = gets.chomp
puts @store_name
new_store = Store.create(name: "#{@store_name}")
puts new_store.errors.messages