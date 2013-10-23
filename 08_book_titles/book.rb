class Book 
   attr_reader :title

   def title=(string) 
#      @title = string.split.map(&:capitalize).join(' ')
      result = string.split
      result = [result[0].capitalize] +
         result[1..-1].map do |word|
            if %w{the a an and in of}.include? word
               word
            else
               word.capitalize
            end
         end
      @title = result.join(' ')
   end

end
