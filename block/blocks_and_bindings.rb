# 局部绑定
def my_method
  x = "Goodbye"
  yield("cruel")
end

x = "Hello"
p my_method { |y| "#{x}, #{y} world" }
# 虽然在方法中也定义了一个变量X，但代码块看到但X还是在代码块定义时绑定的X，方法中的X对这个代码块来说是不可见的。

# =>"Hello, cruel world"
