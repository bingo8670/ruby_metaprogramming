# 用 Module#attr_* 方法定义访问器。Module#attr_reader 可以生成读方法，Module#attr_writer 可以生成写方法，而Module#attr_accessor 可以同时生成两者；
class MyClass
  def my_attribute=(value)
    @my_attribute = value
  end

  def my_attribute
    @my_attribute
  end
end

obj = MyClass.new
obj.my_attribute = 'x'
p obj.my_attribute      # => "x"
