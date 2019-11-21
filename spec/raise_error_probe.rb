puts "Testing raise_error"
require 'raise_error'

include ProbaR::Open

class TestError < StandardError
end

class DummyError < StandardError
end

matcher = raise_error DummyError

unless matcher.compare { raise DummyError }
  raise TestError, "'raise DummyError' should return true"
end

if matcher.compare { nil }
  raise TestError, "'nil' should return false"
end

if matcher.compare { raise StandardError, "this is being tested" }
  raise TestError, "'raise StandardError' should return false when looking for DummyError"
end
