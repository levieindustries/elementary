# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  sort_order :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  validates :name, presence: true
  validates :sort_order, presence: true

  has_many :nominations
  has_many :nominees, through: :nominations
  has_many :votes, through: :nominations
end
