# 检验过的属性之三
require "test/unit"

class Person; end

class TestCheckAttribute < Test::Unit::TestCase
  def setup
    add_checked_attribute(Person, :age) { |v| v >= 18 }
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuse_invalid_values
    assert_raise RuntimeError, "Invalid attribute" do
      @bob.age = 17
    end
  end
end

def add_checked_attribute(klass, attribute, &validation)
  klass.class_eval do
    define_method "#{attribute}=" do |value|
      raise 'Invalid attribute' unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get "@#{attribute}"
    end
  end
end
