def echo word
   word
end

def shout word
   word.upcase!
end

def repeat word, x=2
   ((word + " ") * x).rstrip
end

def start_of_word word, x
   word[0..(x-1)]
end

def first_word sentence
   sentence.split.first
end

def titleize title
   title = (title.split.map! { |word| (%w[and the over is a].include? word) ? word : word.capitalize! }).join(' ')
   title[0] = title[0].capitalize
   title
end

