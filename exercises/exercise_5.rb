require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
puts "Total revenue: #{Store.sum("annual_revenue")}"
puts "Average annual revenue: #{Store.average("annual_revenue")}"
puts "More than $1M: #{Store.where("annual_revenue > 1000000").count}"
