require "pry"

class ShoppingCart
	def initialize (day)
		@items = []
		@day = day
	end
	def add_item (item)
		@items.push item		
	end
	def checkout
		total_cost = 0		
		@items.each do |item|
			if (item.instance_of? Fruit)
				total_cost += item.price(@day)
			else
				total_cost += item.price
			end
		end
		if (@items.length > 5)
			total_cost -= total_cost * (10 / 100)		
		end		
		total_cost
	end	
end

class Item
	def initialize (name, price)
		@name = name
		@price = price
	end
	def price
		@price
	end
end

class Fruit < Item
	def price (day)
		if (day == "sat")
			(@price - @price * (10 / 100))
		else
			@price	
		end	
	end
end

class Houseware < Item
	def price
		if (@price > 100)
			(@price - @price * (5 / 100))
		else
			@price
		end
	end
end	

bananas = Fruit.new "Banana", 10
orange_juice = Item.new "Orange Juice", 10
rice = Item.new "Rice", 1
vacuum_cleaner = Houseware.new "Vacuum Cleaner", 150
anchovies = Item.new "Anchovies", 2

puts "What day is today? (mon|tue|wed|thu|fri|sat|sun)"
day = gets.chomp

rocio_cart = ShoppingCart.new day
rocio_cart.add_item(bananas)
rocio_cart.add_item(rice)
rocio_cart.add_item(vacuum_cleaner)
rocio_cart.add_item(rice)

print_cost = rocio_cart.checkout
puts "the total cost of your shopping is #{print_cost}"

binding.pry