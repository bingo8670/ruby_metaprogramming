# 拟态方法 puts, my_attribute, private, protected 等
class C
  def my_attribute=(value)
    @p = value
  end

  def my_attribute
    @p
  end
end

obj = C.new
obj.my_attribute = 'some value'
p obj.my_attribute    # =>"some value"
