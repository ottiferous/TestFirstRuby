class Book
   def title=(string)
      string.split.map(&:capitalize).join(' ')
      @title = string
   end

   def title
      @title
   end

end
