class Temperature
   
   def initialize opts
      if opts[:f] == nil
         @deg_f = (opts[:c]* (9.0/5.0) + 32)
         @deg_c = opts[:c]
      end
      if opts[:c] == nil
         @deg_c = (opts[:f]-32)*(5.0/9.0)
         @deg_f = opts[:f]
      end
   end
   
   def in_fahrenheit
      @deg_f
   end
   
   def in_celsius
      @deg_c
   end
   
   def self.from_celsius temp
      new(:c => temp)
   end
   
   def self.from_fahrenheit temp
      new(:f => temp)
   end
   
   def ftoc(deg)
    (deg-32)*(5.0/9.0)
   end

   def ctof(deg)
    deg * (9.0/5.0) + 32
   end
   
end

class Celsius < Temperature
   def initialize deg_c
      super(:c => deg_c)
   end
end

class Fahrenheit < Temperature
   def initialize deg_f
      super(:f => deg_f)
   end
end