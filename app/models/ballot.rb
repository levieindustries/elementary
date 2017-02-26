# == Schema Information
#
# Table name: ballots
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ballots_on_user_id  (user_id)
#

class Ballot < ApplicationRecord
  validates :user_id, uniqueness: { scope: [:year] }

  belongs_to :user
  has_many :votes, dependent: :destroy
end
