# 空指针保护（Nil Guard）

# 如果 a 是nil，那么让它成为一个空数组；如果它不是nil，那么什么也不做。
a ||= []
# 等效于
a || (a = [])
