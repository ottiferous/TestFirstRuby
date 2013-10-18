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
