class Fixnum
   
   def in_words
      # begin by reducing the number down into 'word units' and then we can identify
      # each unit by comparing the values to hard-coded values
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
      
      case number
      when 0
         'zero'
      when 1
         'one'
      when 2
         'two'
      when 3
         'three'
      when 4
         'four'
      when 5
         'five'
      when 6
         'six'
      when 7
         'seven'
      when 8
         'eight'
      when 9
         'nine'
      when 10
         'ten'
      when 11
         'eleven'
      when 12
         'twelve'
      when 13
         'thirteen'
      when 14
         'fourteen'
      when 15
         'fifteen'
      when 16
         'sixteen'
      when 17
         'seventeen'
      when 18
         'eighteen'
      when 19
         'nineteen'
      when 20
         'twenty'
      when 30
         'thirty'
      when 40
         'forty'
      when 50
         'fifty'
      when 60
         'sixty'
      when 70
         'seventy'
      when 80
         'eighty'
      when 90
         'ninety'
      when 100
         'one hundred'
      end
   end
   
   
end