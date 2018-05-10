# 把传递给 instance_eval 方法的代码块称为 上下文探针（Contexxt Probe），因为它就像是一个深入到对象中的代码片段，并可以对那个对象进行操作；

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  p self          # => #<MyClass:0x007fdb5d821898 @v=1>
  p @v            # => 1
end
