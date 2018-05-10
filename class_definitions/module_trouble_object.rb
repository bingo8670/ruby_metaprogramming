# obj 被 MyModule 的实例方法所扩展；
module MyModule
  def my_method; 'hello'; end
end

obj = Object.new
class << obj
  include MyModule
end

p obj.my_method                 # => "hello"
p obj.singleton_methods         # =>[:my_method]
