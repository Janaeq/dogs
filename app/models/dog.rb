class Dog < ApplicationRecord
    belongs_to :user
    has_many :walks
    has_many :walkers, through: :walks

    validates :name, :age, :breed, :gender, presence: true
end
