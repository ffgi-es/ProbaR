require 'test'
require 'equal'
require 'expect'

module ProbaR
  def self.describe context, &block
    prueba = ProbaR.new context
    prueba.instance_eval &block
    prueba
  end

  class ProbaR
    attr_reader :results
    def initialize context, &tests
      @tests = []
    end

    def it context, test_class = Test, &block
      @tests.push Test.new(context, &block)
    end

    def run
      @results = @tests.map { |test| test.run.passed? }
    end
  end
end

include ProbaR::Open
