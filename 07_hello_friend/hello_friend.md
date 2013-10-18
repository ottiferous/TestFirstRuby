# Hello Friend

###Before you Begin:
_DO NOT NAME THE FILE hello_friend.rb_

for some reason this test is expecting `friend.rb` instead. If you read the internal documenation it will cover this, but I wanted to point it out because they really broke with their pattern right now and it pissed me off.

- - -

This section is very easy, we are creating a Class and then accessing a method from that class. This should be done after the first problem in this series.

###Step 1

	class Friend
	
	end
we made an empty class called `Friend` that we will use later. The next test says that when its `greeting` method is called it should return "Hello!"

	class Friend
	
	   def greeting
	      "Hello!"
	   end
	
	end
after that we need to allow greeting to take an argument, in this case someone's name, so that it can greet them properly.

	class Friend
	
	   def greeting(name)
	      "Hello, #{name}!"
	   end
	
	end
But wait… that broke the first test! The method needs to take an optional argument. What we need to do is create a new method `initialize` that will be called when we _instantiate_ the `Friend` class

Once that is done we can determine if the function needs to say "Hello!" or "Hello, Bob" by assigning a default value to the optional argument `name` and checking to see if we overwrite it with any value. In this way anything that is not `nil` will cause it to execute.

	class Friend
	   def initialize
	      puts "Hello!"
	   end
	
	   def greeting name = nil
	      if name.nil?
	         "Hello!"
	      else
	         "Hello, #{name}!"
	      end
	   end
	
	end