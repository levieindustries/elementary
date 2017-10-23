module Api
  class Response
    attr_accessor :data, :status, :meta

    def initialize(data, status, meta = {})
      @data = data
      @status = Integer(status)
      @meta = meta

      if meta.key?(:status)
        raise ArgumentError, "Cannot set status in meta section!"
      end
    end

    def body
      { meta: merged_meta, data: data }
    end

    private

    def merged_meta
      meta.merge(status: status)
    end
  end
end
