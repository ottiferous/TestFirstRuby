require 'csv'
require 'sunlight/congress'
require 'erb'
require 'Date'
require 'Time'

Sunlight::Congress.api_key = 'e179a6973728c4dd3fb1204283aaccb5'

def clean_zipcode zipcode

   zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone number

   clean = "0"*10 
   
   case number.length
   when 10
      clean = number
   when 11
      number[0] == '1' ? clean = number : "0"*10
   end
   
   clean
   
end

def time_target date

   day, hour = date.split
   begin
      day = (Date.strptime(day, '%m/%d/%y')).strftime '%A'
      hour = (Time.parse hour).strftime '%H'
   rescue
      day, hour = 0, 0
   end
   [day, hour]
end

def legislators_by_zipcode zipcode

   legislators = Sunlight::Congress::Legislator.by_zipcode zipcode
end

def save_thank_you_letters id, form_letter

   Dir.mkdir 'output' unless Dir.exists? 'output'   
   filename = "output/thanks_#{id}.html"
   File.open filename, 'w' do |file|
      file.puts form_letter
   end
end

puts "EventManager Initialized"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter

regday ||= {}
regday.default = 0

contents.each do |row|

   id = row[0]
   name = row[:first_name]
   zipcode = clean_zipcode row[:zipcode]   
   phone = clean_phone row[:homephone]
   day, hour = time_target row[:regdate]
   legislators = legislators_by_zipcode zipcode
   
   regday[day] += 1
   regday[hour] += 1
   
   form_letter = erb_template.result binding

end

regday.sort.each { |key, value| puts "#{key} -> #{value}" }