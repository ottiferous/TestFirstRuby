def add x, y
	x + y
end

def subtract x, y
	x - y
end

def sum array
   array << 0
   array.inject(:+)
end

def multiply x, y
	x * y
end

def power x, y
	x ** y
end

def factorial x
   (1..x).reduce(1, :*)
end
	
