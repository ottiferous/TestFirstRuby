# Book Titles #08

This is expecting `book.rb` - I think this is becoming a trend.

Reading the spec file it looksl ike they want a `class` called `book` that has a method called `title` that will  automaticaly capitazlie titles except for certain English words that we skip.

e.g. "Alexander the Great" would __not__ have 'the'  capitalized

### Create the class - and capitalize those words!

	class Book
	   
	   def title string
	      string.split.map(&:capitalize).join(' ')
	   end
	end

Lets take a secon and look at this long line we used: `string.split.map(&:capitalize).join(' ')`. What is going on here?

* first we take `string` and `split` it into an array of words ( by default `split` will break a string on spaces)
*  next we need to call `capitalize` on each element of our newly created array. There are multiple ways to do this, but for our purposes lets use `map` to apply the `capitalize` function on each element.
	*  This gives us `map(&:capitalize)` so `capitalize` will be applied to each ( or `&:` ) element of the array
* finally we need to turn it back into a string for the title, so lets call `join(' ')` to make it back into a string

### Wait it failed?

So this section is using something called [accessors](http://www.rubyist.net/~slagell/ruby/accessors.html) they are pretty nifty and have a warm fuzzy place in programmers hearts. Most of them are worried about someone overwriting things that they shouldn't - so they create these methods to get information about the Class you have written. Its like your methods have their own [API](http://www.makeuseof.com/tag/api-good-technology-explained/)!

In ruby we need to set a few things so that the test code can _talk_ to our method. We do this by declaring at the top of our method an `attr_reader` and then change the way our `def` statement looks.

	class Book
	   attr_reader :title
	   
	   def title=(string)
	      @title = string.split.map(&:capitalize).join(' ')
	   end
	end

What we are saying here is that the way to interact with the `title` _variable_ of the `class` named __Book__ we have to say `@Book.title`. This lets us do things, like make sure the result is what we are expecting, and not some random piece of informaiton that the person using our `class` should not be accessing directly.

### The 'articles' section failed in rspec
The next thing to work on is handling the special little words, `the a an and in of` that we do not want to capitalize in a book's title. There is not a good way to do this by length ( the letter i should always be capitalize for example, but a should not) so we have to find another way.

I chose to explicitly list the words that the test was using. I used a new notation - `$w{   }` which takes a list of words and turns each word into an element in an array. This means the following two exmaples are the same:

	never_capitalize_these = %w{the a an and in of}
	never_capitalize_these = ["the", "a", "an", "and", "in", "of"]
	
Now we have to find a new way to get through the words being input - probably by calling `.split` - and then deciding whether we want to capitalize each one. You should also keep in mind that the first word is always capitalized. This incldues book titles that start with one of these words.

### Moving Forward

We have a skeleton of code that takes care of everythign except for inspecting each word in our book's title. To do this a loop will be needed, and then an `if` statement of some kind to see if the word is one of our small words that should not be capitalized.

* The first letter should always be capitalized
* Every word in the title should be capitalized except…
	* conjuctions, prepostiions, and articles
	* these are all small words like those listed above in my example
	
### I'm stuck

Here is some psuedo-code (code that won't run but should give you an idea of where to go from here)

	class Book 
		attr_reader :title
	
		def title=(string) 
			string.capitize

			for each in string.split do |word|
		      		if small_words.include? word
					# don't capitalize word
		      		else
		      			# capitalize word and 
	      			end
			end
			# this is important as we need to use the @ symbol to assign our value back to title
			@title = result.join(' ')	
		end
	end