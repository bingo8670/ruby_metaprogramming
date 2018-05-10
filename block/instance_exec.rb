# 当instance_eval 方法把接收者变为当前对象self时，调用者的实例变量就落到作用域范围外了。
class C
  def initialize
    @x = 1
  end
end

class D
  def twisted_method
    @y = 2
    C.new.instance_eval { "@x: #{@x}, @y: #{@y}" }
  end
end

p D.new.twisted_method    # => "@x: 1, @y: "
