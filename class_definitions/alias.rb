# alias_method 方法中，第一个参数是方法的新名字，第二个参数是方法的原始名字。新名字可以继续被重命名；
class MyClass
  def my_method; 'my_method()'; end
  alias_method :m, :my_method
  alias_method :m2, :m
end

obj = MyClass.new
p obj.my_method      # => "my_method()"
p obj.m              # => "my_method()"
p obj.m2             # => "my_method()"
