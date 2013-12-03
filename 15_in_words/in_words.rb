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
               [1,0] =>'ten',
               [1,1] =>'eleven',
               [1,2] =>'twelve',
               [1,3] =>'thirteen',
               [1,4] =>'fourteen',
               [1,5] =>'fifteen',
               [1,6] =>'sixteen',
               [1,7] =>'seventeen',
               [1,8] =>'eighteen',
               [1,9] =>'nineteen'
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
      
      big_nums = {
               3 =>'hundred',
               4 =>'thousand',
               6 =>'million',
               9 =>'billion',
               12 =>'trillion'
               
      }
      
      ones.default =''
      teens.default =''
      tens.default =''
      big_nums.default =''

      number = self.to_s.split('').map { |x| x.to_i }
      
      string = []
      position = 0
      while ! number.empty?
         
         if number[-2] == 1
            string.unshift teens[number.pop(2)]
            position += 2
         elsif number.size > 1
            y = ones[number.pop]
            x = tens[number.pop]
            string.unshift(x, y)
            position += 2
         else
            string.unshift(ones[number.pop])
            position += 1
         end
         
         string.insert(1, big_nums[position])
         
      end
      
      string.delete_if { |entry| entry =='' }
      string.join(' ').rstrip
      
   end
   
end