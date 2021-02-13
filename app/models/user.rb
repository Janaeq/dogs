class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :walkers, through: :dogs #to ensure that a user can only comment on walkers that are associated with their dogs
    has_many :scheduled_walks, through: :dogs, source: :walks
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
