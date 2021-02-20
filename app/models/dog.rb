class Dog < ApplicationRecord
    # include ActiveModel::Validations
    belongs_to :user
    has_many :walks
    has_many :walkers, through: :walks

    validates :name, :age, :breed, :gender, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 0 }

    # scope? name can be the same as long as user_id is different
    validates_uniqueness_of :name, scope: :user_id
end
