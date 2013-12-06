def translate sentence
   rule = /(^(?<pre>(([^aeiou]*qu)|(^([^aeiou]*))))(?<end>.*))/
   string = ""
   sentence.split.each { |word| string << word[rule, "end"] + word[rule, "pre"] + "ay " }
   string.rstrip
end