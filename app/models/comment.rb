class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :walker

    validates :entry, length: { in: 1..240 }
end
