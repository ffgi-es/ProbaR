require 'probar'

class TestObject
  def add a, b
    a + b
  end
end

describe TestObject do
  it "should add numbers together" do
    obj = TestObject.new
    expect(obj.addr(3, 6)).to eq 9
  end
end
