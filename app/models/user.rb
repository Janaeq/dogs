class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :walkers, through: :dogs #to ensure that a user can only comment on walkers that are associated with their dogs
    has_many :scheduled_walks, through: :dogs, source: :walks
    has_secure_password

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end
