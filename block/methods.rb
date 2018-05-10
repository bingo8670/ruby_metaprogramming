#
class MyClass
  def initialize(value)
    @x = value
  end
  def my_method
    3 * @x
  end
end

object = MyClass.new(2)
m = object.method :my_method
p m.call       # => 6
