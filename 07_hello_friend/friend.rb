class Friend
   def initialize
      puts "Hello!"
   end

   def greeting name = nil
      if name.nil?
         "Hello!"
      else
         "Hello, #{name}!"
      end
   end

end
