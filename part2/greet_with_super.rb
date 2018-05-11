module Greetings
  def greet
    "hello"
  end
end

module EnthusiasticGreetings
  include Greetings

  def greet
    "Hey, #{super}!"
  end
end

class MyClass
  include EnthusiasticGreetings
end

p MyClass.ancestors     # => [MyClass, EnthusiasticGreetings, Greetings, Object, Kernel, BasicObject]
p MyClass.new.greet     # => "Hey, hello!"
