# 类扩展，首先定义my_method 方法，把它作为MyModule 的一个普通实例方法，接着在MyClass 的单件类中包含这个模块；
module MyModule
  def my_method; 'hello'; end
end

class MyClass
  class << self
    include MyModule
  end
end

p MyClass.my_method
