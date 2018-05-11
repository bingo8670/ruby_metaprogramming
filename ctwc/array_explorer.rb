def explore_array(method)
  code = "['a', 'b', 'c'].#{method}"
  puts "Evaluating: #{code}"
  eval code
end

loop { p explore_array(gets()) }

# 输入 find_index("b")
# => Evaluating: ['a', 'b', 'c'].find_index("b")
# => 1
# 输入 map! {|e| e.next }
# => Evaluating: ['a', 'b', 'c'].map! {|e| e.next }
# => ["b", "c", "d"]

# 输入 object_id; Dir.glob("*")   列出程序目录写所有文件，代码注入攻击
# => Evaluating: ['a', 'b', 'c'].object_id; Dir.glob("*")
# => ["class_definitions", "methods", "ruby_metaprogramming.md", "the_m_word", "object_model", "README.md", "ctwc", "block"]
