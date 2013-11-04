class Temperature
   
   def initialize
      
   end
   
   def in_fahrenheit
      
   end
   
   def in_celsius
      
   end
   
   def from_celsius
      
   end
   
   def from_fahrenheit
   
   end
   
   def ftoc(deg)
    (deg-32)*(5.0/9.0)
   end

   def ctof(deg)
    deg * (9.0/5.0) + 32
   end
   
end

class Celsius < Temperature
   
end

class Fahrenheit < Temperature
   
end