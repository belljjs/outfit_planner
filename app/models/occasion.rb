class Occasion < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :items,  dependent: :nullify
end
