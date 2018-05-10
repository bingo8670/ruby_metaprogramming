class String
  alias_method :real_length, :length
  #重命名length方法，相当于复制了一个length方法，命名为real_length

  def length
    # 重新定义length方法，不改变重命名的real_lenght 方法；
    real_length > 5 ? 'long' : 'short'
  end
end

p "War and Peace".length               # => "long"
p "War and Peace".real_length          # => 13
