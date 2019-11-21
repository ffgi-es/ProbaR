puts "Testing equal"
require 'equal'

include ProbaR::Open

class TestError < StandardError
end

matcher = eq 1

unless matcher.compare(1)
  raise TestError, "1 == 1 should return true"
end

if matcher.compare(2)
  raise TestError, "1 == 2 should return false"
end

matcher = eq "foobar"

unless matcher.compare("foobar")
  raise TestError, '"foobar" == "foobar" should return true'
end

if matcher.compare("blam")
  raise TestError, '"foobar" == "blam" should return false'
end
