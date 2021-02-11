class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
