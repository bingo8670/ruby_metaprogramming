class MyClass
  attr_accessor :a

  class << self
    attr_accessor :c
  end
end

obj = MyClass.new
obj.a = 2
p obj.a         # => 2

MyClass.c = "It works!"
p MyClass.c     # => It works!"
