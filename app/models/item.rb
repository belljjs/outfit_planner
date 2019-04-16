class Item < ApplicationRecord
  belongs_to :user
  belongs_to :color
  belongs_to :season
  belongs_to :category
  belongs_to :occasion
end
