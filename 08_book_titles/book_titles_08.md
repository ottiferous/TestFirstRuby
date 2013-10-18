# Book Titles #08

This is expecting `book.rb` - I think this is becoming a trend.

Reading the spec file it looksl ike they want a `class` called `book` that has a method called `title` that will  automaticaly capitazlie titles unless a specific '_article_' is specitifed that will be skipped.

e.g. "Alexander the Great" would have 'the' passed as an argument to not be capitalized

### Create the class

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