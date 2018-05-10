# Class.new 是class 的完美替身。如果把一个代码块传给Class.new，还可以在其中定义实例方法；
my_var = "Success"

MyClass = Class.new do
  # 现在可以在这里打印 my_var 了
  puts "#{my_var} in the class definition!"

  def my_method
    # ...但是怎样在这里把它打印出来呢？
  end
end

# => Success in the class definition!
