class Dog < ApplicationRecord
    # include ActiveModel::Validations
    belongs_to :user
    has_many :walks
    has_many :walkers, through: :walks

    validates :name, :age, :breed, :gender, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 0 }
    validate :does_not_exist

    # scope? name can be the same as long as user_id is different
    def does_not_exist
        if Dog.find_by(name: self.name, age: self.age, breed: self.breed, gender: self.gender)

        end
    end
end
