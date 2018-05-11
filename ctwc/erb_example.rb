require "erb"
erb = ERB.new(File.read("./ctwc/template.rhtml"))
erb.run
