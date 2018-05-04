class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

p my_object = Greeting.new("Hello")
p my_object.class       # => Greeting
p my_object.class.instance_methods(false)    # => [:welcome]，类的实例方法，false表示只要它自己的方法，不要它继承下了的方法。
p my_object.instance_variables               # => [:@text]，对象的实例变量。
