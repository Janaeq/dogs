class Walk < ApplicationRecord
    belongs_to :walker
    belongs_to :dog

    validates :date_time, presence: true

    def dog_attributes=(dog_params)
        if !dog_params[:name].blank?
            self.dog = Dog.find_or_create_by(dog_params)
        end
    end
end