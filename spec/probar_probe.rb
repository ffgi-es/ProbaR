puts "Testing Probar"
require 'probar'

class TestError < StandardError
end

tests = ProbaR::describe "context" do 
  it "Passes this test" do
    expect(1).to eq 1
  end

  it "Fails this test" do
    expect(1).to eq 2
  end
end

tests.run

unless tests.results[0]
  raise TestError, "expect(1).to eq 1 should pass"
end

if tests.results[1]
  raise TestError, "expect(1).to 2 should fail"
end
