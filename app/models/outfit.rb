class Outfit < ApplicationRecord
  belongs_to :weather
  belongs_to :user
end
