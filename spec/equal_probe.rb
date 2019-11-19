puts "Testing equal"
require 'equal'

class TestError < StandardError
end

test = ProbaR::Equal.new 1

unless test.compare(1)
  raise TestError, "1 == 1 should return true"
end

if test.compare(2)
  raise TestError, "1 == 2 should return false"
end

test = ProbaR::Equal.new "foobar"

unless test.compare("foobar")
  raise TestError, '"foobar" == "foobar" should return true'
end

if test.compare("blam")
  raise TestError, '"foobar" == "blam" should return false'
end
