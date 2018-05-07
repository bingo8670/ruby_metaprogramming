# 3 动态派发 高级   内省方式缩减代码
class Computer
  def initialize(computer_id, data_source)
    @id          = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
    # 匹配括号中正则表达式的字符串会被存放到全局变量 $1 中；
  end

  def self.define_component(name)
    define_method(name) do
      info         = @data_source.send "get_#{name}_info", @id
      price        = @data_source.send "get_#{name}_price" @id
      result       = "#{name.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end

define_component :mouse
define_component :cpu
define_component :keyboard
