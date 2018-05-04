class Entity
  attr_reader :table, :ident
  def initialize(table, ident)
    @table = table
    @ident = ident
    Database.sql " INSERT INTO #{@table} (id) VALUES (#{@ident})"
  end

  def set(col, val)
    Database.sql "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{@ident}"
  end

  def get(col)
    Database.sql ("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
  end
end

class Movie < Entity
  def initialize(ident)
    super "movies", ident
  end

  def title
    get "title"
  end

  def title=(value)
    set "title", value
  end

  def director
    get "director"
  end

  def director=(value)
    set "director", value
  end
end

class Movie < ActiveRecord::Base
end
# 两个Movie 类等效，Active Record 在程序运行时动态地创建类 Movie#title 和
# Movie#director= 这样的方法，是不是很高效呢。


movie= Movie.new(1)
movie.title = "Doctor Strangelove"
movie.director = "Stanley Kubrick"
