# Ruby 允许给单个对象增加一个方法；
str = "just a regular string"

def str.title?
  self.upcase == self
end

p str.title?                      # => false
p str.methods.grep(/title?/)      # => [:title?]
p str.singleton_methods           # => [:title?]

# 这段代码为 str添加了一个title？方法，其他对象（即使是String对象）也没有这个方法。只对单个对象生效的方法，称为单件方法（Singleton Method）
