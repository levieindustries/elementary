module Api
  module Responder
    def respond(response)
      render json: response.body, status: response.status
    end

    def respond_with_data(data, status = 200, meta = {})
      respond(Response.new(data, status, meta))
    end

    def response_with_error(message, status, fields = {})
      respond(ErrorResponse.new(message, status, fields))
    end

    def respond_with_exception(exception)
      respond(ExceptionResponse.new(exception))
    end
  end
end
