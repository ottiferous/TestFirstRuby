class Fixnum
   
   def initialize
      @ones = {
               0 => '',
               1 => 'one ',
               2 => 'two ',
               3 => 'three ',
               4 => 'four ',
               5 => 'five ',
               6 => 'six ',
               7 => 'seven ',
               8 => 'eight ',
               9 => 'nine '
      }
      
      @teens = {
               [1,0] => 'ten ',
               [1,1] => 'eleven ',
               [1,2] => 'twelve ',
               [1,3] => 'thirteen ',
               [1,4] => 'fourteen ',
               [1,5] => 'fifteen ',
               [1,6] => 'sixteen ',
               [1,7] => 'seventeen ',
               [1,8] => 'eighteen ',
               [1,9] => 'nineteen '
      }
      
      @tens = {
               0 => '',
               1 => '',
               2 => 'twenty ',
               3 => 'thirty ',
               4 => 'fourty ',
               5 => 'fifty ',
               6 => 'sixty ',
               7 => 'seventy ',
               8 => 'eighty ',
               9 => 'ninety '
      }
      
      @big_nums = {
               3 => 'thousand ',
               6 => 'million ',
               9 => 'billion ',
               12 => 'trillion '
               
      }
      
      @ones.default = ''
      @teens.default = ''
      @tens.default = ''
      @big_nums.default = ''
   end
   
   def in_words
      # odd_words are the ones that need to be evaluated as 'sixty', 'seventy' etc.
      
      return 'zero' if self == 0    # special case, and breaks the pattern otherwise.

      number = self.to_s.split('').reverse.map { |x| x.to_i }
      
      string = ''
      position = 0
      while ! number.empty?
         
         string = @ones[number.pop] + string
         position += 1
         
         if number[-2] == 1
            string = @teens[number.pop(2)] + string
         else
            string = @tens[number.pop] + @ones[number.pop] + string
         end

         position += 2
         
         string = @big_nums + string if @big_nums[position] != nil
         
      end
      
      string
      string.chomp(" ")

   end
   
end