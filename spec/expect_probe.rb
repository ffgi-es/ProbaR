puts "Testing expect"
require 'expect'

include ProbaR

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

begin
  expect(1).to DummyMatcher.new true
rescue FailedTest
  raise TestError, "#to should return true if matcher.compare is true"
end

begin
  expect(1).to DummyMatcher.new false
rescue FailedTest
else
  raise TestError, "#to should return false if matcher.compare is false"
end

begin
  expect(1).not_to DummyMatcher.new false
rescue FailedTest
  raise TestError, "#not_to should return true if matcher.compare is false"
end

begin
  expect(1).not_to DummyMatcher.new true
rescue FailedTest
else
  raise TestError, "#not_to should return false if matcher.compare is true"
end
