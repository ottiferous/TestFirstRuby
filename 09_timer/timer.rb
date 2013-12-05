class Timer
   attr_reader :seconds
   
   def initialize
      @seconds = 0
   end
   
   def seconds=(time=0)
      time >= 0 ? @seconds = time : @seconds = 0
   end
   
   def padded num
      num < 10 ? "0#{num.to_s}" : num.to_s
   end
   
   def time_string
      #not best practice to change @seconds to display time (may be needed later) - but oh well
      hour = @seconds / 3600
      @seconds -= (hour*3600)

      min = @seconds / 60
      @seconds -= (min*60)

      padded(hour) + ":" + padded(min) + ":" + padded(@seconds)
   end
   
end
      
      