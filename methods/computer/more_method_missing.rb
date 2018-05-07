# method_missing，是BasicObject 的一个私有实例方法，因为在祖先链顶端，所以所以对象都可用；
class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method} (#{args.join(',')})"
    puts "(You also passed it a block)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a', 'b') do
  # a block
end
# 覆写 method_missing 方法可以让你调用实际上并不存在的方法。
