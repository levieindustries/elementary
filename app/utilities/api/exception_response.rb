module Api
  class ExceptionResponse < ErrorResponse
    attr_reader :exception

    def initialize(exception)
      @exception = exception

      message, status = handle_exception
      super(message, status)
    end

    private

    def handle_exception
      case @exception
      when ActiveRecord::RecordNotFound
        ['not found', 404]
      when ActiveRecord::RecordInvalid
        [@exception.message, 422]
      else
        [@exception.message, 500]
      end
    end
  end
end
