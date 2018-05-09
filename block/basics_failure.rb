def a_method(a, b)
  a + yield(a, b)    # yield 代表代码块
end

p a_method(1, 2) {|x, y| (x + y) * 3}  # => 1+(1+2)*3=10

def b_method
  return yield if block_given?
  # block_given? 方法可询问当前方法调用是否包含块
  'no block'
end

p b_method                         # =>"no block"
p b_method { "here's a block!" }   # =>"here's a block!"
