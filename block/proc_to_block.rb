# 使用 & 操作符可把 Proc 转换成代码块
def my_method(greeting)
  "#{greeting}, #{yield}"
end

my_proc = proc { "Bill" }
p my_method("Hello", &my_proc)    # => "Hello, Bill"

# 调用 my_method 方法时，&操作符会把 my_proc 转换为代码块，再把代码块传给这个方法。
