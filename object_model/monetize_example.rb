require "monetize"

bargain_price = Monetize.from_numeric(99, "USD")
p bargain_price.format

# 通过调用 Numeric#to_money 方法把任意数值转换为一个Money对象：

standard_price = 100.to_money("USD")
p standard_price.format       # => "$100.00"
