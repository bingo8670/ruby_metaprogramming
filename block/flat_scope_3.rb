# 使用一个方法调用(动态方法) Module#define_method来替换 def 关键字，Module#new 替换 module 关键字，
my_var = "Success"

MyClass = Class.new do
  # 现在可以在这里打印 my_var 了
  puts "#{my_var} in the class definition!"

  define_method :my_method do
    puts "#{my_var} in the method"
  end
end

MyClass.new.my_method

# => Success in the class definition!
# => Success in the method
