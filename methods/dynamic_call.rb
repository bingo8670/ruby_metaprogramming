# Object#send 方法代替点标识符来调用 MyClass#my_method 方法;
# send 方法的第一个参数为你要发送给对象的消息，也就是方法的名字（:my_method）
class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
p obj.my_method(3)           # => 6
p obj.send(:my_method, 3)    # => 6
