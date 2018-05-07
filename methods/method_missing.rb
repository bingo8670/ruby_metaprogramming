# method_missing，是BasicObject 的一个私有实例方法，因为在祖先链顶端，所以所以对象都可用；
class Lawyer
end

nick = Lawyer.new
p nick.talk_simple
# => undefined method `talk_simple' for #<Lawyer:0x007fe9c3846890> (NoMethodError)
