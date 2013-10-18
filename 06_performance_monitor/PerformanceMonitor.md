#Performance Monitor

Use a `yield` statement to trigger the function to end, and then pick back up. Can now be called in the middle of other blocks,

	def measure
		start_time = Time.now
		yield
		end_time = Time.now
		end_time - start_time
	end
	
We can make this handle __n__ calls by creating an input argument and calling `n.times do`

	def measure n=1
	   result = 0
	   n.times do
	      start_time = Time.now
	
	      yield
	      
	      end_time = Time.now
	      result = end_time - start_time
	   end
	   result
	end
	
#####NOTE - there is an error above when calculating `result`
- - -

The final test needs to return the average times from running the code block, not the total time. We will need to change result to be an `average_time` by dividing by __n__

	def measure n=1
	   result = 0
	   n.times do
	      start_time = Time.now
	
	      yield
	      
	      end_time = Time.now
	      result += end_time - start_time
	   end
	   result / n
	end