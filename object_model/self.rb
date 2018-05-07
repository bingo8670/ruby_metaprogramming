#调用一个方法时，接收者会扮演self 的角色；
class MyClass
  def testing_self
    @var = 10              # self 的一个实例变量
    my_method              # 与self.my_method() 相同
  end

  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new
obj.testing_self
