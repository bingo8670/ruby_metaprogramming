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
  prepend EnthusiasticGreetings
  # prepend 方法在祖先链中把模块插到类的下方
end

p MyClass.ancestors[0..2]     # => [EnthusiasticGreetings, Greetings, MyClass]
p MyClass.new.greet           # => "Hey, hello!"
