# encoding: utf-8
# HANDLE CLI ARGUMENTS
class Arguments
  attr_reader :args

  def initialize(args)
    @args = args                                             # provide args from cli
    %w(wildside before after prepend append delete inject).each {|var| define_var(var) }  # dynamically define vars
    @after = true if !@before && !@after                     # inject after is the default
    @inject = (!@inject && (@delete || @prepend || @append)) ? false : true
    puts @inject
  end

  def valid_input
    puts @delete
    puts @inject
    puts @before
    puts @after
    return false if @args.size < 3 || (@before && @after) || @args[0..2].find_index('--help')
    return false if @inject && @delete
    puts @delete
    true
  end

  def method_missing(method_name, *arguments, &_block)
    instance_variable_set("@#{method_name.to_s.chop}", arguments[0]) if method_name.to_s =~ /=$/
  end

  private

    def define_var(arg)
      if (does_match = @args[0..5].find_index("--#{arg}"))
        instance_variable_set("@#{arg}", !!@args.slice!(does_match)) # remove inject before arg
      end
      self.class.class_eval("attr_reader :#{arg}")                   # define new readable var
    end
end
