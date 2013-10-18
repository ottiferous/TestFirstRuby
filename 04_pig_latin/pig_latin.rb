def translate(sentence)
   response = ""
   vowels = ["a", "e", "i", "o", "u"]
   phonemes = ["qu", "ch", "sh", "th", "br"]
   phonemes2 = ["squ", "sch", "thr"]

   for word in sentence.split do
      if vowels.include? word[0..0]
         response += word + "ay "
      elsif phonemes2.include? word[0..2]
         response += word[3..-1] + word[0..2] + "ay "
      elsif phonemes.include? word[0..1]
         response += word[2..-1] + word[0..1] + "ay "
      else
         response += word[1..-1] + word[0..0] + "ay "
      end
   end
   response.rstrip!
end


def translate(sentence)

   response = ""
   vowels = ["a", "e", "i", "o", "u"]

   for word in sentence.split do
      until vowels.include? word[0..0] do
         word = word[1..-1] + word[0..0]
         if word[-1..-1].upcase == "Q" && word[0..0].upcase == "U"
            word = word[1..-1] + word[0..0]
         end
      end
      response += word + "ay "
   end
   response.rstrip!
end
