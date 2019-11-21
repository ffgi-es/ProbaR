require 'probar'

class TestObject
  def add a, b
    a + b
  end
end

class TestError < StandardError
end

tests = ProbaR::describe TestObject do
  it "should add numbers together" do
    obj = TestObject.new
    expect(obj.add(3, 6)).to eq 9
  end

  it "returns false when they don't match" do
    expect(13).to eq 14
  end

  it "should test for errors" do
    expect { raise TestError }.to raise_error TestError
  end

  it "returns false when nothing is raised" do
    expect { 3 + 4 }.to raise_error TestError
  end
end

tests.run

puts "\nResults:"
puts tests.results
