#
def event(description, &block)
  @event << { :description => description, :condition => block }
end

load 'events.rb'
# 加载所有名字以events.rb 结尾的文件，并执行文件中的代码。这些代码会调用 RedFlag 的 event 方法；


# => ALERT: an event that always happens，必须切到文件的子目录才能运行成功；
