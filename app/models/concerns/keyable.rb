module Keyable
  extend ActiveSupport::Concern

  included do
    has_many :api_keys, as: :keyable
  end
end
