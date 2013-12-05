class XmlDocument
   
   def initialize indent = false
      @indent = indent
      @indent_lvl = 0
   end
   
   def method_missing name, *args, &block
      attr = args[0] || {}
      xml = ""
      xml << "  "*@indent_lvl if @indent
      xml << "<#{name}"
      attr.each_pair do |key, value|
         xml << " #{key}='#{value}'"
      end
      
      if block
         xml << ( @indent ? ">\n" : ">" )
         @indent_lvl += 1
         xml << yield
         @indent_lvl -= 1
         xml << "  "*@indent_lvl if @indent
         xml << ( @indent ? "</#{name}>\n" : "</#{name}>" )
      else
         xml << ( @indent ? "/>\n" : "/>" )
      end
      xml
   end
   
end