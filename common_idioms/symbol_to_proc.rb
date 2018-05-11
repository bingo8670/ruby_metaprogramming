# Symbol To Proc

names = [ 'bob', 'bill', 'heather']
p names.map { |name| name.capitalize }    # => ["Bob", "Bill", "Heather"]

class Symbol
  def to_proc
    Proc.new { |x| x.send(self) }
  end
end
p names.map(&:capitalize.to_proc)         # => ["Bob", "Bill", "Heather"]
p names.map(&:capitalize)                 # => ["Bob", "Bill", "Heather"]
