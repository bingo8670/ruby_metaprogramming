# 整数的+ 操作符只是名为 Fixnum#+ 方法的语法糖而已；
class Fixnum
  alias_method :old_plus, :+

  def +(value)
    self.old_plus(value).old_plus(1)    # 在原方法的基础上加一
  end
end

p 1 + 1        # => 3
