# 读取用户输入
user_input = "User input: #{gets()}"
puts user_input.tainted?
# 调用 tainted? 方法来判断一个对象是不是被污染来；

# 输入 x = 1
