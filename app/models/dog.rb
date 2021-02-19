class Dog < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :user
    has_many :walks
    has_many :walkers, through: :walks

    validates :name, :age, :breed, :gender, presence: true
    # how to validate that the name is not repeated in the list of the current user's dogs
    validates_with DogValidator
end
