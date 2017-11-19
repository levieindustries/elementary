# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  keyable_type :string           not null
#  keyable_id   :integer          not null
#  token        :string           not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_api_keys_on_keyable_type_and_keyable_id  (keyable_type,keyable_id)
#  index_api_keys_on_token                        (token) UNIQUE
#

class ApiKey < ApplicationRecord
  belongs_to :keyable, polymorphic: true

  scope :active, -> { where(deleted_at: nil) }

  before_create :set_token!

  def set_token!
    self.token = self.class.generate_token
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(32)
  end
end
