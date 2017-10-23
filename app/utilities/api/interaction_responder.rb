module Api
  module InteractionResponder
    include Responder

    def respond_to_interaction(interaction, args)
      respond_to_success(interaction.run(args)) do |result|
        data = block_given? ? (yield result) : result
        respond_with_data(data)
      end
    end

    def respond_to_success(outcome)
      if outcome.valid?
        yield outcome.result
      else
        respond_with_error(
          outcome.errors.full_messages.join(", "),
          status(outcome),
          outcome.errors.messages
        )
      end
    end

    def respond_to_delete(interaction, args)
      respond_to_success(interaction.run(args)) do
        respond_with_data(nil, 204)
      end
    end

    private

    def not_found?(outcome)
      outcome.errors.details.values.flatten.map do |d|
        d.fetch(:error)
      end.include?(:not_found)
    end

    def status(outcome)
      not_found?(outcome) ? 404 : 400
    end
  end
end
