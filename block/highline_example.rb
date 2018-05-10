#
require "highline"

h1 = HighLine.new
friends = h1.ask("Friends?", lambda { |s| s.split(',') })
puts "You're friends with: #{friends.inspect}"

=begin
< Friends?
  请输入： Ivana, Roberto
< You're friends with: ["Ivana", " Roberto"]
=end

name = h1.ask("Name?", lambda { |s| s.capitalize })
puts "Hello, #{name}"

=begin
< Name?
  请输入： bill
< Hello, Bill        延迟执行
=end
