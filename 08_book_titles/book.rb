def Book
   
   def title string
      string.split.map(&:capitalize).join(' ')
   end
end
