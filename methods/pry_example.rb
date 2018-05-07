# pry
require "pry"

pry = Pry.new
pry.memory_size = 101      # 内存大小
p pry.memory_size          # => 101
pry.quiet = true           # 静默

# 重新配置实例
pry.refresh(:memory_size => 99, :quiet => false)
p pry.memory_size          # => 99
pry.quiet                # => false
