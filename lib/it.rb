require 'failedtest'

module ProbaR
  def it(context, &block)
    Test.new(context, &block)
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
end
