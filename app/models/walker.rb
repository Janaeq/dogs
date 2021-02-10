class Walker < ApplicationRecord
    has_many :comments #made about them
    has_many :walks
    has_many :dogs, through: :walks
end
