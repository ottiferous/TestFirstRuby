class Dictionary

   def initialize
      @entries = Hash.new
   end

   def entries
      @entries
   end

   def add new_entry
      new_entry.class == Hash ? @entries.merge!(new_entry) : @entries[new_entry] = nil
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
      @entries.sort.each { |key, value| string << "[#{key}] \"#{value}\"\n"}
      string.chomp
   end
end
