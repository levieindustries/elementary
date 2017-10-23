module Api
  class ErrorResponse < Response
    attr_reader :message, :fields

    def initialize(message, status, fields = {}, meta = {})
      @message = message
      @fields = fields
      super({}, status, meta)

      raise ArgumentError.new("Error status less than 400!") if status < 400
    end

    def body
      { error_fields: fields, error: message, meta: merged_meta }
    end
  end
end
