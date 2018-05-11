# 环绕命名：Around Alias，从一个重新定义的方法中调用原始的、被重命名的版本；
class String
  alias_method :old_reverse, :reverse

  def reverse
    "x#{old_reverse}x"
  end
end

p "abc".reverse      # => "xcbax"


# 白板类：Blank Slate，移除一个对象中的所以方法，以便把它们转换成幽灵方法；
class C
  def method_missing(name, *args)
    "a Ghost Method"
  end
end
obj = C.new
p obj.to_s            # => "#<C:0x007f8db800bc78>"

class D < BasicObject
  def method_missing(name, *args)
    "a Ghost Method"
  end
end

blank_slate = D.new
p blank_slate.to_s    # => "a Ghost Method"


# 类扩展：Class Extension，通过向类的单件类中加入模块来定义类方法，是对象扩展的一个特例；
class C; end

module M
  def my_method
    'a class method'
  end
end

class << C
  include M
end

p C.my_method            # => "a class method"


# 类实例变量：Class Instance Variable，在一个Class对象的实例变量中存储类级别的状态；
class C
  @my_class_instance_variable = "some value"

  def self.class_attribute
    @my_class_instance_variable
  end
end

p C.class_attribute              # => "some value"


# 类宏：Class Macro，在类定义中使用类方法。
class C; end
class << C
  def my_macro(arg)
    "my_macro(#{arg}) called"
  end
end

class C
  p my_macro :x                  # => "my_macro(x) called"
end


# 洁净室：Clean Room，使用一个对象作为执行一个代码块的环境；
class CleanRoom
  def a_useful_method(x); x * 2; end
end

p CleanRoom.new.instance_eval { a_useful_method(3) }     # => 6


# 代码处理器：Code Processor，处理从外部获得的代码字符串。
# File.readlines("a_file_containing_lines_of_ruby.txt").each do |line|
#   puts "#{line.chomp} ==> #{eval(line)}"
# end


# 上下文探针：Context Probe，执行一个代码块来获取一个对象上下文中的信息；
class C
  def initialize
    @x = "a private instance variable"
  end
end

obj = C.new
p obj.instance_eval { @x }           # => "a private instance variable"


# 延迟执行：Deferred Evaluation，在 proc 或 lambda 中存储一段代码及其上下文，用于以后执行；
class C
  def store(&block)
    @my_code_capsule = block
  end

  def execute
    @my_code_capsule.call
  end
end

obj = C.new
obj.store { $X = 1 }
$X = 0

obj.execute
p $X          # => 1


# 动态派发：Dynamic Dispatch，在运行时决定调用哪个方法；
method_to_call = :capitalize
obj = "abc"

p obj.send(method_to_call)     # => "Abc"


# 动态方法：Dynamic Method，在运行是决定怎样定义一个方法；
class C
end

C.class_eval do
  define_method :my_method do
    "a dynamic method"
  end
end

obj = C.new
p obj.my_method           # => "a dynamic method"


# 动态代理：Dynamic Proxy，把不能对应某个方法名的消息转发给另外一个对象；
class MyDynamicProxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    "result: #{@target.send(name, *args, &block)}"
  end
end

obj = MyDynamicProxy.new("a string")
p obj.capitalize           # => "result: A string"


# 扁平作用域：Flat Scope，使用闭包在两个作用域之间共享变量；
class C
  def an_attribute
    @attr
  end
end

obj = C.new
a_variable = 100
# flat scope:
obj.instance_eval do
  @attr = a_variable
end

p obj.an_attribute        # => 100


# 幽灵方法：Ghost Method，响应一个没有关联方法的消息；
class C
  def method_missing(name, *args)
    name.to_s.capitalize
  end
end
obj = C.new
p obj.my_ghost_method      # => "My_ghost_method"


# 钩子方法：Hook Method，覆写一个方法来截获对象模型事件；
$INHERITORS = []
class C
  def self.inherited(subclass)
    $INHERITORS << subclass
  end
end

class G < C
end
class E < C
end
class F < E
end
p $INHERITORS        # => [G, E, F]


# 内核方法：Kernel Method，在 Kernel 模块中定义一个方法，使得所以对象都可使用；
module Kernel
  def a_method
    "a kernel method"
  end
end

p a_method           # => a kernel method"


# 惰性实例变量：Lazy Instance Variable，等第一次访问一个实例变量时才对它进行初始化；
class C
  def attribute
    @attribute = @attribute || "some value"
  end
end

obj = C.new
p obj.attribute           # => "some value"


# 拟态方法：Mimic Method，把一个方法伪装成另外一种语言构件；
def BaseClass(name)
  name == "string" ? String : Object
end

# class C < BaseClass "string"         # 一个看起来像类的方法
#   attr_accessor :an_attribute        # 一个看起来像关键字的方法
# end

obj = C.new
obj.an_attribute = 1                 # 一个看起来像属性的方法


# 猴子补丁：Monkeypatch，修改已有类的特性
p "abc".reverse       # => "xcbax"
class String
  def reverse
    "override"
  end
end

p "abc".reverse      # => "override"


# 命名空间：Namespace，在一个模块中定义常量，以防止命名冲突
module MyNamespace
  class Array
    def to_s
      "my class"
    end
  end
end

p Array.new                         # => []
p MyNamespace::Array.new.to_s       # => "my class"


# 空指针保护：Nil Guard，用“或”操作符覆写一个空引用；
x = nil
p y = x || "a value"                # => "a value"


# 对象扩展：Object Extension，通过给一个对象的单件类混入模块来定义单件方法；
obj = Object.new
module M
  def my_method
    'a singleton method'
  end
end

class << obj
  include M
end

p obj.my_method              # => "a singleton method"


# 下包含包装器：Prepended Wrapper，调用一个用prepend 方式覆写的方法；
module M
  def capitalize
    "x#{super}x"
  end
end

String.class_eval do
  prepend M
end

p "abc".capitalize       # => "xAbcx"


# 细化：Refinement，为类打补丁，作用范围仅到文件结束，或仅限于包含模块的作用域中；
module MyRefinement
  refine String do
    def reverse
      "my reverse"
    end
  end
end

p "abc".reverse             # => "override"
using MyRefinement
p "abc".reverse             # => "my reverse"


# 细化封装器：Refinement Wrapper，在细化中调用非细化的方法；
module StringRefinement
  refine String do
    def reverse
      "x#{super}x"
    end
  end
end

using StringRefinement
p "abc".reverse              # => "xoverridex"


# 沙盒：Sandbox，在一个安全的环境中执行未授信的代码；
def sandbox(&code)
  proc {
    $SAFE = 2
    yield
  }.call
end
begin
  sandbox { File.delete 'a_file' }
rescue Exception => ex
  p ex           # =>
end


# 作用域门：Scope Gate，用 class， module 或 def 关键字来隔离作用域；
a = 1
p defined? a            # => "local-variable"

module MyModule
  b = 1
  p defined? a          # => nil
  p defined? b          # => "local-variable"
end

p defined? a            # => "local-variable"
p defined? b            # => nil


# Self Yield：把 self 传给当前代码块
class Person
  attr_accessor :name, :surname

  def initialize
    yield self
  end
end

joe = Person.new do |p|
  p.name    = "Joe"
  p.surname = "Smith"
end


# 共享作用域：Shared Scope，在用一个扁平作用域的多个上下文中共享变量；
lambda {
  shared = 10
  self.class.class_eval do
    define_method :counter do
      shared
    end
    define_method :down do
      shared -= 1
    end
  end
}.call
p counter               # => 10
3.times { down }
p counter               # => 7


# 单件方法：Singleton Method，在一个对象上定义一个方法；
obj = "abc"

class << obj
  def my_singleton_method
    "x"
  end
end

p obj.my_singleton_method      # => "x"


# 代码字符串：String of Code，执行一段表示Ruby 代码的字符串；
my_string_of_code = "1 + 1"
p eval(my_string_of_code)      # => 2


# 符号到Proc：Symbol TO Proc，把一个调用单个方法的块转换为一个符号；
p [1, 2, 3, 4].map(&:even?)    # => [false, true, false, true]
# even？ 方法用于判定是否是偶数；
