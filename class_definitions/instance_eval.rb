# 使用 instance_eval 方法来定义一个单件方法；
s1, s2 = "abc", "def"

s1.instance_eval do
  def swoosh!; reverse; end
end

p s1.swoosh!                    # => "cba"
p s2.respond_to?(:swoosh!)      # => false
