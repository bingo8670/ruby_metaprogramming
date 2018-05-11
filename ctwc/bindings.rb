class MyClass
  def my_method
    @x = 1
    binding
    # binding 对象可以看做一个比块更“纯净”的闭包，因为之包含作用域而不包含代码
  end
end

b = MyClass.new.my_method
p eval "@x", b             # => 1
# eval 方法，可以给它一个binding 对象作为额外的参数，代码可以在这个Binding对象所携带的作用域中执行；
