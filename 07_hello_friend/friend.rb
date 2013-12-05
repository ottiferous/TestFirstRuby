class Friend
   def initialize
      puts "Hello!"
   end

   def greeting name = nil
      name.nil? ? "Hello!" : "Hello, #{name}!"
   end

end
