class RPNCalculator
   
   def initialize
      @num_stack = []
   end
   
   def push num
      @num_stack.push num
   end
   
   def tokens string
      string.split.map! { |token| token[/\d/] ? token.to_i : token.to_sym }
   end
   
   def evaluate string
      tokens(string).each do |key|
         case key
            when Fixnum 
               push key
            when :+
               plus
            when :-
               minus
            when :*
               times
            when :/
               divide
         end
      end
      value
   end
   
   def plus
      raise "calculator is empty" unless @num_stack.size >= 2
      @num_stack.push @num_stack.pop(2).inject(:+) 
   end
   
   def minus
      raise "calculator is empty" unless @num_stack.size >= 2
      @num_stack.push @num_stack.pop(2).inject(:-)
   end
   
   def times
      raise "calculator is empty" unless @num_stack.size >= 2
      @num_stack.push @num_stack.pop(2).inject(:*)
   end
   
   def divide
      raise "calculator is empty" unless @num_stack.size >= 2
      @num_stack.push @num_stack.pop(2).inject(:fdiv)
   end
   
   def value
      @num_stack[-1]
   end
   
end