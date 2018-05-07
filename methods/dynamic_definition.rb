class MyClass
  # 动态方法 define_method：在运行时定义方法的技术
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
p obj.my_method(3)         # => 9
