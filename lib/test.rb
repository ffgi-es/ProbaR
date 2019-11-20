require 'failedtest'

module ProbaR
  class Test
    attr_reader :context, :reason
    def initialize(context, &block)
      @context = context
      @test = block
    end

    def run
      begin
        @test.call
      rescue FailedTest => failed_test
        @reason = failed_test.message
        @passed = false
      else
        @passed = true
      end
      self
    end

    def passed?
      @passed
    end
  end
end
