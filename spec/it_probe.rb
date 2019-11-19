puts "Testing it"
require 'probar'

class TestError < StandardError
end

test = it "message" do
  #this test passes without issue
end

test.run

unless test.passed?
  raise TestError, "Test without failure should pass"
end
unless test.context == "message"
  raise TestError, "Test with out failure should have a context"
end

test = it "message" do
  raise FailedTest, "This is how it failed"
end

test.run

if test.passed?
  raise TestError, "Test with failure shouldn't pass"
end
unless test.context == "message"
  raise TestError, "Test with failure should have a context"
end
unless test.reason == "This is how it failed"
  raise TestError, "Test with a failure should hava a reason"
end
