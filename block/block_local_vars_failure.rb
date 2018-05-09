# 代码块内定义额外的绑定，但这些绑定在代码块结束时就结束了；
def just_yield
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
  local_to_block = 1
end

p top_level_variable       # => 2
p local_to_block           # => Error!
