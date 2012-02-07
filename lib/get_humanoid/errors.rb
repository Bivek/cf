module GetHumanoid
  class Error < StandardError
    attr_reader :code, :status

    def initialize(error)
      # Pass the text message through, adding code and status
      @code   = error['code']
      @status = error['status']

      super error['error']
    end

  end
end
