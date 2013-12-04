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
      
      ones.default = ''
      teens.default = ''
      tens.default = ''
      big_nums.default = ''

      number = self.to_s.split('').map { |x| x.to_i }
      
      string = []
      position = 0
      pop_num = 2
      while ! number.empty?

         a, b = number.pop(pop_num)
         
         string.unshift()
         if a == 1 && b != nil
            string.unshift teens[[a,b]]
            position += pop_num
         elsif b == nil
            string.unshift ones[a]
            position += 1
         else
            string.unshift(tens[a], ones[b])
            position += pop_num
         end
         
         pop_num == 1 ? pop_num = 2 : pop_num = 1

         # don't add a big_num word if the last entry was blank.
         string.insert(1, big_nums[position]) if string[0] != ''

      end
      
      string.delete_if { |entry| entry == '' }

      string.join(' ').rstrip
      
   end
   
end