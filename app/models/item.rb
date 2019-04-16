class Item < ApplicationRecord
  belongs_to :user
  belongs_to :color
  belongs_to :season
  belongs_to :category
  belongs_to :occasion

  has_one_attached :image, dependent: false

  has_many :joints, dependent: :destroy
  has_many :outfits, through: :joints
end
