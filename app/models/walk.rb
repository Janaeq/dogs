class Walk < ApplicationRecord
    belongs_to :walker
    belongs_to :dog

    validates :date_time, presence: true
    validates_associated :dog
    # validate that the date is in the future 
    validate :date_cannot_be_in_the_past

    # scope method to find upcoming walk
    scope :next_walk, -> { order(date_time: :desc).limit(1) }
    
    def dog_attributes=(dog_params)
        if !dog_params[:name].blank?
            self.dog = Dog.find_or_create_by(dog_params)
        end
    end

    def display_date
        self.date_time.strftime("%A, %b %d") if self.date_time
    end

    def display_time
        self.date_time.strftime("%I:%M%P") if self.date_time
    end

    def date_cannot_be_in_the_past
        errors.add(:date_time, "can't be in the past") if date_time < Date.today
    end
end