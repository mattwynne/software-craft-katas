class Module
  def attribute(*args, &block)
    if args.first.is_a? Hash
      args.first.each do |k,v|
        make_attribute(k, v)
      end
    else
      make_attribute(*args, &block)
    end
  end
  
  def make_attribute(attribute_name, default_value=nil, &block)
    define_method("#{attribute_name}_default_value") do
      return instance_eval(&block) if block
      default_value  
    end
    class_eval %Q{
      
      def #{attribute_name}? 
        !!#{attribute_name}
      end
      def #{attribute_name}=(value)
        @#{attribute_name}_value = value
      end
      def #{attribute_name}
        return @#{attribute_name}_value if instance_variables.include?("@#{attribute_name}_value")
        #{attribute_name}_default_value
      end
    }
  end
end





