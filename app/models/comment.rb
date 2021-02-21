class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :walker

    validates :entry, length: { in: 1..240 }

    def display_date
        self.created_at.strftime("%B %e")
    end
end
