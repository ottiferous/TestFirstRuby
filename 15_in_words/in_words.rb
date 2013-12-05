class Fixnum
   
   def in_words

      return'zero' if self == 0 # special case, and breaks the pattern otherwise.

      ones = { 1 =>'one', 2 =>'two', 3 =>'three', 4 =>'four', 5 =>'five', 6 =>'six', 7 =>'seven', 8 =>'eight', 9 =>'nine' }
      teens = { 0 =>'ten', 1 =>'eleven', 2 =>'twelve', 3 =>'thirteen', 4 =>'fourteen', 5 =>'fifteen', 6 =>'sixteen', 7 =>'seventeen', 8 =>'eighteen', 9 =>'nineteen' }
      tens = { 2 =>'twenty', 3 =>'thirty', 4 =>'forty', 5 =>'fifty', 6 =>'sixty', 7 =>'seventy', 8 =>'eighty', 9 =>'ninety' }
      hundreds = { 1 =>'thousand', 2 =>'million', 3 =>'billion', 4 =>'trillion' }

      ones.default = ''
      teens.default = '' 
      tens.default = ''
      hundreds.default = ''

      number = self.to_s.split('').map { |x| x.to_i }
      
      word = []
      powers = 0
      while ! number.empty?
         set = number.pop 3
         string = []
         case set.size
         when 3
            string << ones[set[0]] << ( ones[set[0]] != '' ? 'hundred' : '' )
            string << ( set[1] == 1 ? teens[set[2]] : [tens[set[1]], ones[set[2]]] )
         when 2
            string << ( set[0] == 1 ? teens[set[1]] : [tens[set[0]], ones[set[1]]] )
         when 1
            string.unshift ones[set[0]]
         end
         word.unshift string.flatten
      end
      
      # inserts the 'special' words like hundreds, thousands, etc.
      result = []
      word.reverse!
      while ! word.empty?
         result << word.pop
         result << ( result.last.uniq != [''] ? hundreds[word.size] : '' )
      end
      
      # compact multidimensional arrays and delete '' [empty] entries
      result = result.flatten.delete_if { |entry| entry == ''  }
      result.join(' ')
      
   end
   
end