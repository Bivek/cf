module GetHumanoid

  class GetHumanoidError
    attr_reader :status, :error

    def initialize(status, error)
      @status = status
      @error  = error
    end
  end

  class BadRequest         < GetHumanoidError; end
  class Unauthorized       < GetHumanoidError; end
  class NotFound           < GetHumanoidError; end
  class ServerError        < GetHumanoidError; end
  class ServiceUnavailable < GetHumanoidError; end

end
