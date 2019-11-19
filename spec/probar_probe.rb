puts "Testing Probar"
require 'probar'

class TestError < StandardError
end

test = it "This is a test" do
  expect(1).to eq 1
end

test.run

unless test.passed?
  raise TestError, "expect(1).to eq 1 should pass"
end

test = it "This is a failing test" do
  expect(1).to eq 2
end

test.run

if test.passed?
  raise TestError, "expect(1).to eq 2 should fail"
end

