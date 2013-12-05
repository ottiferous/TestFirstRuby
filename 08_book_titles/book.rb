class Book 
   attr_reader :title

   def title=(string) 
      result = string.split
      @title = ([result[0].capitalize] + 
         result[1..-1].map { |word| (%w{the a an and in of}.include? word) ? word : word.capitalize }).join(' ')
   end

end
