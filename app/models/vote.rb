# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  nomination_id :integer          not null
#  ballot_id     :integer          not null
#  year          :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_votes_on_ballot_id      (ballot_id)
#  index_votes_on_nomination_id  (nomination_id)
#

class Vote < ApplicationRecord
  validates :nomination, presence: true
  validates :ballot, presence: true

  belongs_to :ballot
  belongs_to :nomination
  has_one :category, through: :nomination
end
