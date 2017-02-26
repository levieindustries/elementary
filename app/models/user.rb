# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :ballots, dependent: :destroy
  has_many :votes, through: :ballot

  def current_ballot!
    ballots.where(year: 2017).first_or_create
  end
end
