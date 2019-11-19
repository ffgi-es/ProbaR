module ProbaR
  def expect value
    result = Expect.new(value)
  end

  def it(context, &block)
    Test.new(context, &block)
  end

  class Expect
    attr_reader :value
    def initialize value
      @value = value
    end

    def to matcher
      matcher.compare(value)
    end

    def not_to matcher
      !matcher.compare(value)
    end
  end

  class Test
    attr_reader :context, :reason
    def initialize(context, &block)
      @context = context
      @test = block
    end

    def run
      @test.call
    rescue FailedTest => failed_test
      @reason = failed_test.message
      @passed = false
    else
      @passed = true
    end

    def passed?
      @passed
    end
  end

  class FailedTest < StandardError
  end
end

include ProbaR
