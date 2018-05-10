# 块对象：Proc，是由块转换来的对象；
# Ruby 的标准库中提供来一个Proc类。Proc就是由块转换来的对象；你可以把代码块传给Proc.new 方法来创建一个Proc。以后就可以用Proc#call 方法来执行这个由代码块转换而来的对象；

# 五种转换方法之一，延迟执行
inc = Proc.new { |x| x + 1 }
p inc.class     # => Proc
p inc.call(2)   # => 3

# 五种转换方法之二
dec = lambda { |x| x -1 }
p dec.class
p dec.call(2)

# 五种转换方法之三，（带刺的）stabby lambda
p = ->(x) { x + 1}

# 五种转换方法之四
p = lambda { |x| x + 1 }
