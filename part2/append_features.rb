module M
  def self.append_features(base); end
end

class C
  include M
end

p C.ancestors     # => [C, Object, Kernel, BasicObject]
# 通过覆写 append_features 方法，阻止了一个模块被包含的动作；
