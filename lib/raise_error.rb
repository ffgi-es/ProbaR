module ProbaR
  module Open
    def raise_error error
      RaiseError.new error
    end
  end

  class RaiseError
    def initialize error
      @error = error
    end

    def compare value = nil, &block
      yield
    rescue StandardError => e
      return true if e.class == @error
    else
      return false
    end
  end
end
