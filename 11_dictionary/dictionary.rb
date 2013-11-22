class Dictionary

   def initialize
      @entries = Hash.new
      @entries.default = nil
   end

   def entries
      @entries
   end

   def add new_entry
      @entries.merge!(new_entry) if new_entry.class == Hash
      @entries[new_entry] = nil if new_entry.class == String
   end

   def keywords
      @entries.keys.sort
   end

   def include? value
      @entries.has_key? value
   end

   def find string
      @entries.select { |key, value| key.include? string }
   end

   def printable
      string = ""
      @entries.sort.each { |key, value| string += "[#{key}] \"#{value}\"\n"}
      string.chomp
   end
end
