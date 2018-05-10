# 细化封装器 Refinement Wrapper，作用范围只到文件末尾处；
module StringRefinement
  refine String do
    def length
      super > 5 ? 'long' : 'short'     # super 调用没有细化的原始方法；
    end
  end
end

using StringRefinement
p "War and Peace".length               # => "long"
