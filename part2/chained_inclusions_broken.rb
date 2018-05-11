# 链式包含问题，模块包含模块
module SecondLevelModule
  def self.included(base)
    base.extend ClassMethods      # 扩展方法
    # 调用 SecondLevelModule.included 方法时，base 参数的值不是 BaseClass，而是 FirstLevelModule。因此 SecondLevelModule::ClassMethods 模块中定义的方法就成了 FirstLevelModule 模块的类方法。
  end

  def second_level_instance_method; 'ok'; end

  module ClassMethods
    def second_level_class_method; 'ok'; end
  end
end

module FirstLevelModule
  def self.included(base)
    base.extend ClassMethods      # 扩展方法
  end

  def first_level_instance_method; 'ok'; end

  module ClassMethods
    def first_level_class_method; 'ok'; end
  end

  include SecondLevelModule
end

class BaseClass
  include FirstLevelModule
end

# 实例方法，需要先新建实例
p BaseClass.new.first_level_instance_method
p BaseClass.new.second_level_instance_method

# 类方法，直接引用
p BaseClass.first_level_class_method
p BaseClass.second_level_class_method
