# == Schema Information
#
# Table name: nominations
#
#  id          :integer          not null, primary key
#  nominee_id  :integer
#  category_id :integer
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  winner      :boolean          default(FALSE)
#
# Indexes
#
#  index_nominations_on_category_id  (category_id)
#  index_nominations_on_nominee_id   (nominee_id)
#

class Nomination < ApplicationRecord
  validates :category, presence: true
  validates :nominee, presence: true

  belongs_to :nominee, class_name: "Film"
  belongs_to :category
  has_many :votes
end
