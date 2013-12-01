class Array
   
   def sum
      if self.empty?
         return 0
      else
         self.reduce(:+)
      end
   end
   
   def square
      if self.empty?
         return []
      else
         self.map { |x| x**2 }
      end
   end
   
   def square!
      self.map! { |x| x**2 }
   end
end