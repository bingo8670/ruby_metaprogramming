#
require "awesome_print"

local_time = { :city => "Rome", :now => Time.now }
ap local_time, :indent => 2

# {
#   :city => "Rome",
#   :now => 2018-05-07 12:23:27 +0800
# }
