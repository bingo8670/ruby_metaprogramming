# 钩子方法（Hook Method），提供了一种方式用于在程序运行时扩展程序的行为。
class String
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end
end
class MyString < String; end

# => String was inherited by MyString
