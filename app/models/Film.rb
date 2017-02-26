# == Schema Information
#
# Table name: films
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Film < ApplicationRecord
  validates :name, presence: true

  has_many :categories, through: :nominations
  has_many :nominations
end
