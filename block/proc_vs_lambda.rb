# 在proc中，return的行为有所不同，不是从proc中返回，而是从定义proc的作用域中返回；
def double(callable_object)
  callable_object.call * 2
end

l = lambda { return 10 }
p double(l)           # => 20

def another_double
  p = Proc.new { return 10 }
  result = p.call
  return result * 2   # 不可到达的代码！
end

p another_double      # => 10
