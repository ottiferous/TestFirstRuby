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
But wait… that broke the first test! The method needs to take an optional argument.