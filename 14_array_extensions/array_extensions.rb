class Array
   
   def sum
      self.empty? ? 0 : self.reduce(:+)
   end
   
   def square
      self.empty? ? [] : self.map { |x| x**2 }
   end
   
   def square!
      self.map! { |x| x**2 }
   end
end