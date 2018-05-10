# 下包含包装器（Prepended Wrapper），Module#prepend 方法与include 类似，把包含的模块插在祖先链的中该类的下方，这意味着被prepend 方法包含的模块可以覆写该类的同名方法，同时可以通过 super调用该类的原始方法；
module ExplicitString
  def length
    super > 5 ? 'long' : 'short'     # super 调用没有细化的原始方法；
  end
end

String.class_eval do
  prepend ExplicitString
end

p "War and Peace".length               # => "long"
