# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  name                            :string           not null
#  email                           :string           not null
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  crypted_password                :string
#  salt                            :string
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#

class User < ApplicationRecord
  include BCrypt

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> {
    new_record? || changes[:crypted_password]
  }

  has_many :ballots, dependent: :destroy
  has_many :votes, through: :ballot

  def current_ballot!
    ballots.where(year: 2017).first_or_create
  end

  def password=(value)
    self.crypted_password = Password.create(value)
  end

  def password
    @password ||= Password.new(crypted_password)
  end
end
