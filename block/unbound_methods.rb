# 调用 Module#instance_method 方法获得一个自由方法；
module MyModule
  def my_method
    42
  end
end

unbound = MyModule.instance_method(:my_method)
p unbound.class        # => UnboundMethod
