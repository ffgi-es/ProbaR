module ProbaR
  module Open
    def eq value
      Equal.new value
    end
  end

  class Equal
    attr_reader :value
    def initialize value
      @value = value
    end

    def compare value
      self.value == value
    end
  end
end
