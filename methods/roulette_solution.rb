# 按姓名生成随机数，数字最小的去帮大家买咖啡；
# bug: 无限循环，第11行代码不能被执行，因为超出method_missing的作用域范围；

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank
puts number_of.bill
