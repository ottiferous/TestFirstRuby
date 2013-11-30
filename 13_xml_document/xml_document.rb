class XmlDocument
   
   def method_missing(name, *args, &block)
      attr = args[0] || {}
      xml = "<#{name}"
      attr.each_pair do |key, value|
         xml += " #{key}='#{value}'"
      end
      
      if block
         xml += ">"
         xml += yield
         xml += "</#{name}>"
      else
         xml += "/>"
      end
      xml
   end
   
end