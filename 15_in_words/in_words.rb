class Fixnum
   
   def single num

        case num
        when 1
           'one '
        when 2
           'two '
        when 3
           'three '
        when 4
           'four '
        when 5
           'five '
        when 6
           'six '
        when 7
           'seven '
        when 8
           'eight '
        when 9
           'nine '
        end
   end
   
   def ugly_switch num
         
      case num
      when 1
         'one '
      when 2
         'two '
      when 3
         'three '
      when 4
         'four '
      when 5
         'five '
      when 6
         'six '
      when 7
         'seven '
      when 8
         'eight '
      when 9
         'nine '
      end

      case num
      when 10
         'ten '
      when 11
         'eleven '
      when 12
         'twelve '
      when 13
         'thirteen '
      when 14
         'fourteen '
      when 15
         'fifteen '
      when 16
         'sixteen '
      when 17
         'seventeen '
      when 18
         'eighteen '
      when 19
         'nineteen '
      when 20
         'twenty '
      when 30
         'thirty '
      when 40
         'forty '
      when 50
         'fifty '
      when 60
         'sixty '
      when 70
         'seventy '
      when 80
         'eighty '
      when 90
         'ninety '
      when 100
         'one hundred '
      else
         ''
      end
   end
   
   def in_words
      # odd_words are the ones that need to be evaluated as 'sixty', 'seventy' etc.
      
      return 'zero' if self == 0    # special case, and breaks the pattern otherwise.

      number = self.to_s.split('').reverse.map { |x| x.to_i }
      odd_words = (1..(number.size-1)).step(3).select {|x| x}
      
      position = 1
      number.each do |x|
         
         
         
      
      
      number = self
      trillions = number / 1_000_000_000_000
      number -= (trillions * 1_000_000_000_000)
      
      billions = number / 1_000_000_000
      number -= (billions * 1_000_000_000)
      
      millions = number / 1_000_000
      number -= (millions * 1_000_000)
      
      thousands = number / 1_000
      number -= (thousands * 1_000)
      
      hundreds = number / 100
      number -= (hundreds * 100)
      
      tens = number / 10
      number -= (tens * 10)
      
      string = ''
      
      string += ugly_switch trillions
      string += ugly_switch billions
      string += ugly_switch millions
      string += ugly_switch thousands
      string += ugly_switch hundreds
      string += ugly_switch tens
      string += ugly_switch number
      
      string.chomp(" ")

   end
   
end