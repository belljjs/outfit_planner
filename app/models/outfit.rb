class Outfit < ApplicationRecord
  belongs_to :weather
  belongs_to :user


  has_many :joints, dependent: :destroy
  has_many :items, through: :joints
end
