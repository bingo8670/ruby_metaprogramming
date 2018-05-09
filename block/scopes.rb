# 显示作用域是如何切换的
# Ruby 没有嵌套式的作用域，它的作用域是截然分开的：一旦进入一个新的作用域，原先的绑定会被替换为一组新的绑定。这意味这程序进入MyClass后， v1就落在了作用域范围之外，从而不可见了；

v1 = 1
class MyClass
  v2 = 2
  local_variables            # => [:v2]

  def my_method
    v3 = 3
    local_variables
  end
  local_variables            # => [:v2]
end

obj = MyClass.new
p obj.my_method                # =>[:v3]
p obj.my_method                # =>[:v3]
p local_variables              # =>[:v1, :obj]
