require "pry"

class ShoppingCart
	def initialize
		@items = []
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
	def initialize (day, name, price)
		super(name, price)
		@day = day
	end
	def price
		if (@day == "sat" && @day == "sun")
			@price - @price * (10 / 100)
		else
			@price	
		end	
	end
end

class Houseware < Item
	def price
		if (@price > 100)
			@price - @price * (5 / 100)
		else
			@price
		end
	end
end	

binding.pry