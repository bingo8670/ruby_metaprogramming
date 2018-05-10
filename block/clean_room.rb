#
class CleanRoom
  def current_temperature
    # ...
  end
end

cleanroom = CleanRoom.new
cleanroom.instance_eval do
  if current_temperature < 20
    # TODO: wear jacket
  end
end
