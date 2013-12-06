def echo word
   word
end

def shout word
   word.upcase!
end

def repeat word, x=2
   sentence = ""
   x.times { sentence << word + " " }
   sentence.rstrip
end

def start_of_word word, x
   word[0..(x-1)]
end

def first_word sentence
   sentence.split.first
end

def titleize sentence
   response = ""
   exclude = %w[and the over is a]
   for each in sentence.split() do
      if exclude.include? each
         response += each + " "
      else
         response += each.capitalize + " "
      end
   end
   response.rstrip!
   response[0..0] = response[0..0].upcase
   response
end

