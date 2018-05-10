# Ruby 定义类方法的三种方式；
# 第一种方式重复类类的名字，会给重构带来不便；
def MyClass.a_class_method
end

# 第二种方式的优点在于self存在与类定义之中，就代表类本身；
class MyClass
  def self.another_class_method
  end
end

# 第三种方式最诡异：它打开了该类的单件类，在那里定义类方法，明确表明单件类才是类方法真正的所在之处。
class MyClass
  class << self
    def yet_another_class_method
    end
  end
end
