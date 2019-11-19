puts "Testing expect"
require "probar"

class TestError < StandardError
end

class DummyMatcher
  def initialize bool
    @bool = bool
  end

  def compare value
    @bool
  end
end

unless expect(1).to DummyMatcher.new true
  raise TestError, "#to should return true if matcher.compare is true"
end

if expect(1).to DummyMatcher.new false
  raise TestError, "#to should return false if matcher.compare is false"
end

unless expect(1).not_to DummyMatcher.new false
  raise TestError, "#not_to should return true if matcher.compare is false"
end

if expect(1).not_to DummyMatcher.new true
  raise TestError, "#not_to should return false if matcher.compare is true"
end
