class Timer
   attr_reader :seconds
   
   def initialize
      @seconds = 0
   end
   
   def seconds=(time=0)
      if time >= 0
         @seconds = time
      else
         @seconds = 0
      end
   end
   
   def padded num
      if num < 10
         return "0" + num.to_s
      end
      return num.to_s
   end
   
   def time_string
      time = @seconds   # don't want to overwrite the original
      hour, minute, second = 0, 0, 0

      # if the dividend is smaller than the divisor it gives a 0 
      # which in our next step will make the math time -= (0*3600)
      # or time -= 0 so we don't have to worry about if statements
      hour = time / 3600
      time -= (hour*3600)

      min = time / 60
      time -= (min*60)

      second = time
      
      # We have our time stored into hour, minute, seconds
      
      return ( padded(hour) + ":" + padded(min) + ":" + padded(second) )
      
   end
   
end
      
      