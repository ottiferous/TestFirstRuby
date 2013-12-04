class Fixnum
   
   def in_words

      return'zero' if self == 0    # special case, and breaks the pattern otherwise.
      
      ones = {
               0 =>'',
               1 =>'one',
               2 =>'two',
               3 =>'three',
               4 =>'four',
               5 =>'five',
               6 =>'six',
               7 =>'seven',
               8 =>'eight',
               9 =>'nine'
      }
      
      teens = {
               0 =>'ten',
               1 =>'eleven',
               2 =>'twelve',
               3 =>'thirteen',
               4 =>'fourteen',
               5 =>'fifteen',
               6 =>'sixteen',
               7 =>'seventeen',
               8 =>'eighteen',
               9 =>'nineteen'
      }
      
      tens = {
               0 =>'',
               1 =>'',
               2 =>'twenty',
               3 =>'thirty',
               4 =>'forty',
               5 =>'fifty',
               6 =>'sixty',
               7 =>'seventy',
               8 =>'eighty',
               9 =>'ninety'
      }
      
      hundreds = {
               1 =>'thousand',
               2 =>'million',
               3 =>'billion',
               4 =>'trillion'
               
      }
      
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
         
         if set.size == 3
            string << ones[set[0]] << ( ones[set[0]] != '' ? 'hundred' : '' )
            if set[1] == 1
               string << teens[set[2]]
            else
               string << [tens[set[1]], ones[set[2]]]
            end         
         elsif set.size == 2
            if set[0] == 1
               string << teens[set[1]]
            else
               string << [tens[set[0]], ones[set[1]]]
            end            
         elsif set.size == 1
            string.unshift ones[set[0]]
         end
         
         string.flatten!
         string.compact!

         powers += 1 if number.empty? == false

         # special case for single word events
         
#         if (number.empty? == false && self % 10 == 0)
#            string.insert(0,hundreds[powers]) 
#         elsif ! number.empty?
#            string.unshift(hundreds[powers])
#         end

         word.unshift string
         
      end
      
      result = []
      word.reverse!
      while ! word.empty?
         result << word.pop
         result << ( result.last.uniq != [""] ? hundreds[word.size] : '' )
      end
            
      #word = word.flatten.delete_if { |entry| entry == ''  }      
      #word.delete('thousand') if self % 1_000_000 == 0
      result = result.flatten.delete_if { |entry| entry == ''  }
      result
      result.join(' ')
      
   end
   
end