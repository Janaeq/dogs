class Dog < ApplicationRecord
    belongs_to :user
    has_many :walks
    has_many :walkers, through: :walks
end
