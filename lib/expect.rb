require 'failedtest'

module ProbaR
  module Open
    def expect value = nil, &block
      Expect.new value, block
    end
  end

  class Expect
    attr_reader :value
    def initialize value, block
      @value = value
      @block = block
    end

    def to matcher
      raise FailedTest unless matcher.compare(value, &@block)
    end

    def not_to matcher, &block
      raise FailedTest if matcher.compare(value, &@block)
    end
  end
end
