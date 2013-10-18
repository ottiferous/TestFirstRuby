def add(x, y)
	x + y
end
def subtract(x, y)
	x - y
end
def sum(myarray)
	total = 0
	if myarray
		for num in myarray
			total += num
		end
	end
	total
end

def multiply(x, y)
	x * y
end

def power(x, y)
	x ** y
end

def factorial(x)
	while x > 0 do
		x += (x-1)
	end
	x
end
	
