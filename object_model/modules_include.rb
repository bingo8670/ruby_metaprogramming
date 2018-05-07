# 查找祖先链，向右一步，然后在向上查找
module M1
  def my_method
    'M1#my_method()'
  end
end

module M2
  def my_method
    'M2#your_method()'
  end
end

class C
  include M1     # include 把模块插到类的上方
  prepend M2     # prepend 把模块插到类的下方
end

class D < C ;
end

p D.ancestors    # =>[D, M2, C, M1, Object, Kernel, BasicObject]
