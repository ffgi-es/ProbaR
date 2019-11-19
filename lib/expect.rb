module ProbaR
  def expect value
    Expect.new value
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
end
